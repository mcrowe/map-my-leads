MapMyLeads (http://mapmyleads.herokuapp.com/)
Demo Unbounce Api Client Application


DEV SETUP:
---------------
To talk to lp-webapp locally, you need to be able to access the app using the 'api' sub-domain. Add the following line to your /etc/hosts file: "127.0.0.1 api.unbouncedev.com"

Start lp-webapp on port 3000, and map-my-leads on port 3001 (rails server -p 3001).

Visit api.unbouncedev.com:3000/oauth/applications and sign in as an admin user when prompted.
Create a new application, with redirect uri "http://localhost:3001/oauth/callback" , and write down the client id and secret.

Add your client id and secret to the 'settings.local.yml' file, e.g.:

oauth2_client_id: your_id
oauth2_client_secret: your_secret


PRODUCTION SETUP:
--------------------
For security, add oauth credentials as herok environment variables. Set the following variables:
OAUTH2_CLIENT_ID
OAUTH2_CLIENT_SECRET


DEPLOYMENT:
--------------------------
git push heroku master