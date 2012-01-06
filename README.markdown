Prayer App

This is a port of my PrayerWeb app that I have created in .Net 2.0 back in 2005 to Rails 3. 

I am using this to better learn Rails 3.

TODOS:
-Research about the parsing of an XML file for the display of a daily Westminster catechism Q and A in the prayer_pages/home view.
-Within the views, reference the <%= stylesheet_link_tag "main" %> explicitly to reduce ambiguity within the asset pipeline?
-For CSS the ESV API renders its div class as 'esv-text'. Use that for home and today view styling.
-change the instance variables in prayer_pages_controller to local variables and in today.html.erb remove the instance variable references when testing complete.
