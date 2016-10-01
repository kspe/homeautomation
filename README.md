# Mobile app

Mobile app is available here: https://app.kalm.pl

It is a basic mobile focused interface for:
* listing all `Devices` defined in admin app
* allowing to modify controls per `Device`

Notes:

* Button controls can result in one of two popups: `error` or `success` - it depends if AJAX call to defined (or undefined) URL was succesfull or not
* Slider and Select controls have simple error popup in case of error or timeout of corresponding AJAX call - in case of success no popup is displayed to prevent user distraction on each control change
* Any changes to controls are reflected on admin app

# Admin app

Admin app is available here: https://admin.kalm.pl

The usual workflow is:
1. Create `Device Type` record
2. Add wanted controls to created `Device Type`
3. Create `Device`
4. Assign proper `Device Type` to created `Device`

Notes:

* `Device Type` can be shared by multiple `Devices` - it means you can have multiple devices of the same type (e.g. three Apple TVs) and they will have the same controls
* `Controls` values are stored per `Device` so although `Device Types` are shared, the values are scoped by `Device`
* Any changes to admin app are reflected on mobile app

# Server

The apps are deployed to DigitalOcean droplet with IP: 45.55.183.87
* Serving by Nginx with Unicorn
* DB is Postgresql

# Technology

* Prototyped in Rails 4.2.5.2 (apps are separated by route scopes)
* HAML for templating
* Cocoon for dynamic forms
* JBuilder for JSON API
* Capistrano for deployment
