Prayer App

This is a port of my PrayerWeb app that I have created in .Net 2.0 back in 2005 to Rails 3. 

I am using this to better learn Rails 3.

TODOS: 
-Update the reading link in the prayer_pages/home view to reflect the current month via an instance variable from the helper.
-Research about the parsing of an XML file for the display of a daily Westminster catechism Q and A in the prayer_pages/home view.
-Within the views, reference the <%= stylesheet_link_tag "main" %> explicitly to reduce ambiguity within the asset pipeline?
-Substitute the REST QueryString key param of IP for my personal one.
-Update the links from the prayer_page/home target to _blank so that a new window is launched.
