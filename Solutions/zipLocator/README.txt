README.txt file for the ZipLocatorAndMapDemo from Bill's Newbie Pages
---------------------------------------------------------------------

You should be able to just copy all the files in this ZIPped directory into 
a directory that can be served by your webserver and start running the demo.
And I believe the code will work "as is" so long as you are running via
    http://localhost

But in order for the code to work on a "live" web site, you must obtain a
license key for the maps from Google.  You can do so by visiting
    http://code.google.com/apis/maps/index.html
and clicking on the link to "Sign up for a Google Maps API key".  You will
then need to replace the key used in the 
    zipLocatorAndMapDemo.asp
file.  The location should be obvious, on line 9 of that file.

*******************

However, the Access database included here ("zipcodes.msb") contains ONLY
SAMPLE DATA!  In particular, it includes only zip codes starting in the
range of 94000 to 95999, the general San Francisco Bay Area of California.

The full database is a licensed product and is available for $5 from
     http://www.teamredline.com/zc/
But if you have another source for a similar database, feel free to use
it, instead.  THIS IS NOT A RECOMMENDATION for any particular database.
The one from TeamRedLine is adequate, though I have found several small 
errors in it.

The database contains only one table, named "ZipCodes".

The fields in that table are
    zipcode (text, 5 characters)
    latitude (number, double)
    longitude (number, double)
    city (text, 50)
    statename (text, 50)
    state (text, 50)
    latitudeMiles (number, double)
    longitudeMPD (number, double)

As delivered from TeamRedLine (and other vendors), the last two fields there
are *NOT* included.  The sample database in the zipped directory has two
Stored Queries included that will create and initialize those fields.  
For your convenience, the code for each query is given here:

QUERY:    AddPrecalculationFields
    alter table zipcodes add latitudeMiles DOUBLE, longitudeMPD DOUBLE

(As you can see, that query just adds the last two fields noted above
to the existing table.)

QUERY:    PrecalculateValues
     UPDATE ZipCodes 
     SET latitudeMiles = 69.1*latitude, 
         longitudeMPD = 69.1*cos(latitude*3.14159265/180);

(This query simply precalculates numbers for those two added fields,
which will improve performance of the code in the ASP page.)

When you obtain your copy of the full set of zip codes, you will need to 
add those two stored queries to that database.  The query names aren't 
important, so you can simply go into the QUERIES view and select
"Create Query in Design View" and then choose "SQL View" from the 
"View" menu.  Copy/paste each of those queries (one at a time, of course)
and save them to your own database.  Then execute them in the order 
given above.

If you get an error when executing the second query that indicates that 
*SOME* of your records could not be updated, don't worry about it.  That's 
because most of the full databases have certain zip codes that do not have
latitude or longitude values (APO and FPO post office boxes for military
overseas, for example) and so the numeric calculations fail.  

If you get any other error, you'll have to troubleshoot to make sure
you have the same field names (change them to match, if need be) and/or
data types (also change them to match).  Try again.

***********************

The marke ".gif" files provided are crude but workable.  Feel free to use 
them, but also feel free to invent your own!

***********************

I am *NOT* prepared to answer EVERY question you may have, but if you have
real problems integrating some other database from some other source or
you discover a bug in the program, feel free to write me at
     asp@JuncoJunction.com

Bill Wilkinson
