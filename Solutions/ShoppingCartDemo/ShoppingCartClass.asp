<% 
' Define Constants 
' (Not really needed here, as only the PROPERTY GET methods in the
'  the ShoppingCartItem class need them.  It wouldn't offend my 
'  sensibilities to do away with them and just use numbers in that class code.)
CONST CARTPID = 0 
CONST CARTPNAME = 1 
CONST CARTPPRICE = 2 
CONST CARTPQUANTITY = 3 

' A fairly lightweight wrapper for a single item in the shopping cart.
'
' By providing only limited ways to create an item 
CLASS ShoppingCartItem

    PRIVATE oneItem

    PUBLIC SUB NewItem( pid, name, price, qty )
        price = CDBL(price)
        qty = CLNG(qty)
        oneItem = Array( pid, name, price, qty )
    END SUB

    PUBLIC PROPERTY GET productID( )
        productID = oneItem( CARTPID )
    END PROPERTY

    PUBLIC PROPERTY GET productName( )
        productName = oneItem( CARTPNAME )
    END PROPERTY

    PUBLIC PROPERTY GET productPrice( )
        productPrice = oneItem( CARTPPRICE )
    END PROPERTY 

    PUBLIC PROPERTY GET productQuantity( )
        productQuantity = oneItem( CARTPQUANTITY )
    END PROPERTY 

    PUBLIC PROPERTY LET productQuantity( qty )
        oneItem( CARTPQUANTITY ) = CLNG(qty)
    END PROPERTY

    ' it would be nice if these two could be a "friend" functions accessible 
    ' only by shoppingCart class, but VBS isn't that sophisticated
    PUBLIC DEFAULT PROPERTY GET item( )
        item = oneItem
    END PROPERTY 
    PUBLIC PROPERTY LET item( itemarray )
        oneItem = itemarray
    END PROPERTY 

END CLASS


' The main class that the user sees...
'
' Public Methods are minimal:
'    SUB AddItem( pid, name, price, qty )
'    FUNCTION RemoveItem( pid )
'    FUNCTION ChangeQuantity( pid, qty )
'    FUNCTION SaveToDatabase( )
'
' In all of those, the arguments are:
'    pid   == product ID (e.g., SKU)
'    name  == product Name
'    price == product per unit price
'    qty   == quantity ordered in this cart
'
' For the FUNCTIONs, the return value is a string.
' Either just a blank string if all is okay or an error message.
'
CLASS ShoppingCart

    PRIVATE localCart

    PRIVATE SUB Class_Initialize
        Dim scart, ix, anItemem
        scart = Session("ShoppingCart")
        If Not IsArray(scart) Then
            ReDim localCart(0) ' we never use the ZERO slot of the array
        ELSE
            ReDim localCart(UBOUND(scart))
            For ix = 1 To UBOUND(scart)
                SET anItem = New shoppingCartItem
                anItem.item = scart(ix)
                Set localCart(ix) = anItem
            NEXT
        END IF                
    END SUB

    PRIVATE SUB Class_Terminate
        SaveCart ' is this ever really needed??  It shouldn't be
    END SUB

    PRIVATE FUNCTION GetItemIndexByID( pid )
        Dim ix
        FOR ix = 1 TO UBound(localCart)
            IF localCart(ix).productID = pid THEN
                 GetItemIndexByID = ix
                 EXIT FUNCTION
            END IF
        NEXT
        GetItemIndexByID = -1
    END FUNCTION

    PRIVATE SUB SaveCart( )
        Dim scart, ix
        REDIM scart( UBOUND( localCart ) )
        FOR ix = 1 To UBound(localCart) 
            scart(ix) = localCart(ix).item
        NEXT
        Session("shoppingCart") = scart
    END SUB

    PUBLIC SUB AddItem( pid, name, price, qty )
        ' OPTIONAL:  If the quantity passed in is zero, do nothing at all
        qty = CLNG(qty)
        If qty = 0 THEN EXIT SUB

        ' first, see if there is already that pid in the cart:
        DIM item 
        DIM ix
        ix = GetItemIndexByID( pid )
        IF ix < 0 THEN
            ' nope...it's a new item
            Set item = New ShoppingCartItem
            Call item.NewItem( pid, name, price, qty )
            ReDim Preserve localCart( UBound(localCart) + 1 )
            Set localCart( UBound(localCart) ) = item
        ELSE
            ' just change the quantity by adding the current quantity to existing:
            Set item = localCart(ix)
            item.productQuantity = CLNG(item.productQuantity) + qty
            ' if that just changed the quantity to zero, then remove the item from the cart
            IF item.productQuantity <= 0 THEN
                RemoveItem pid
                EXIT SUB ' cart already saved, so don't do it again
            END IF
        END IF
        SaveCart
    END SUB

    PUBLIC FUNCTION RemoveItem( pid )
        RemoveItem = ""
        ' first, see if that pid is in the cart:
        DIM item 
        DIM ix
        ix = GetItemIndexByID( pid )
        IF ix <= 0 Then
            ' OOPS!!
            RemoveItem = "No item with productID " & pid & " in the shopping cart"
            EXIT FUNCTION
        END IF
        ' so we need to move all items with index higher than ix down a row:
        DIM rix
        FOR rix = ix + 1 TO UBOUND( localCart ) ' if removing last item, FOR doesn't do anything
            SET localCart( rix-1 ) = localCart( rix )
        NEXT
        ' and then cart is one item smaller
        REDIM PRESERVE localCart( UBOUND(localCart) - 1 )
        SaveCart
    END FUNCTION    

    PUBLIC FUNCTION ChangeQuantity( pid, qty )
        ChangeQuantity = ""
        ' if the quantity to be changed to is zero, then just delete the item, instead:
        qty = CLNG(qty)
        IF qty <= 0 THEN
            RemoveItem pid
            EXIT FUNCTION ' cart was saved by RemoveItem
        END IF

        ' first, see if that pid is in the cart:
        DIM item 
        DIM ix
        ix = GetItemIndexByID( pid )
        IF ix <= 0 Then
            ' OOPS!!
            ChangeQuantity = "No item with productID " & pid & " in the shopping cart"
            EXIT FUNCTION
        END IF
        localCart(ix).productQuantity = qty
        SaveCart
    END FUNCTION

    ' And then the set of properties used by the display routine to find that values to be displayed:
    '
    PUBLIC PROPERTY GET itemCount( )
        itemCount = UBound(localCart)
    END PROPERTY

    PUBLIC PROPERTY GET productID( index )
        IF index = INT(index) AND index > 0 AND INDEX <= UBound(localCart) THEN productID = localCart(index).productID
    END PROPERTY

    PUBLIC PROPERTY GET productName( index )
        productName = localCart(index).productName
    END PROPERTY

    PUBLIC PROPERTY GET productPrice( index )
        productPrice = localCart(index).productPrice
    END PROPERTY 

    PUBLIC PROPERTY GET productQuantity( index )
        productQuantity = localCart(index).productQuantity
    END PROPERTY 


END CLASS
%>
 
