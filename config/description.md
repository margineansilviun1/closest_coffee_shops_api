 Creeaza un Github repository nou

- Adaugă descrierea problemei la README.md

- Folosește GitFlow ca să rezolvi problema

- Trimite-ne link-ul către Pull Request

Folosește best practices să rezolvi problema cât mai bine.

Overview
You have been hired by a company that builds an app for coffee addicts. You are responsible for
writing a REST API that offers the possibility to take the user&#39;s coordinates and return a list of
the three closest coffee shops (including distance from the user) in order from the closest to
farthest.
Data
The coffee shops are stored in a remote CSV having these columns: Name,X,Y
The quality of data in this list of coffee shops may vary. Malformed entries should be handled
appropriately.
Notice that the data file will be read from a network location (ex:
https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv )
API Response
A list of the three closest coffee shops (name, location and distance from the user) in order from
the closest to farthest.
These distances should be rounded to four decimal places.
Assume all coordinates lie on a plane.
Use JSON API Specification for client requests and server responses.
Example
For the provided coordinates X=47.6 and Y=-122.4 the response should contain these coffee
shops:
Starbucks Seattle2
Starbucks Seattle

Datele ce vin de pe coffe_shops.csv
Starbucks Seattle,47.5809,-122.3160
Starbucks SF,37.5209,-122.3340
Starbucks Moscow,55.752047,37.595242
Starbucks Seattle2,47.5869,-122.3368
Starbucks Rio De Janeiro,-22.923489,-43.234418
Starbucks Sydney,-33.871843,151.206767