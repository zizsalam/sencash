# Deploy Sencash in One Click

Below are our "one-click deploy" options for running Sencash in the cloud:

## Render

Welcome to the one-click deploy guide for Sencash on [Render](https://render.com/)!

Render is a hosting platform with a generous free tier and makes it easy to get
started with Sencash:

- Getting started is FREE
- Up and running in <5 minutes
- Your Sencash app is automatically deployed to a live URL

### Estimated Costs

- FREE to _get up and running_
- $7 per month for a basic app (Render requires you to upgrade your database to
  keep using it)
- $14+ per month for optimal performance

_**IMPORTANT:** if you plan to host Sencash on Render long-term, you MUST upgrade
your database to a paid Render service._

### Instructions

#### Step 1: Create Render Blueprint

<a href="https://render.com/deploy?repo=https://github.com/maybe-finance/maybe">
<img src="https://render.com/images/deploy-to-render-button.svg" alt="Deploy to Render" />
</a>

1. Click the button above.
2. Sign in or create your account with Render (FREE)
3. Give your blueprint a name (we suggest `Sencash`)
4. Select the `main` branch
5. You should see a section at the bottom with a "Key:Value" field
   for `SECRET_KEY_BASE`. Do NOT click "generate".
6. On your computer, open a terminal and make sure you have
   the [openssl](https://github.com/openssl/openssl) utility installed on your
   computer. You can run `openssl --version` to verify it is installed.
7. Generate your `SECRET_KEY_BASE` by running the following command in your
   terminal: `openssl rand -hex 64` ([docs](https://www.openssl.org/docs/man1.1.1/man1/rand.html)).
8. Do NOT share this value with anyone.
9. Go back to your browser and paste this value in the "Value" field
   for `SECRET_KEY_BASE`
10. Click "Apply". This will take a few minutes.
11. Once complete, click on the `maybe` "Web Service". You should see a custom
    URL in the format `https://maybe-abcd.onrender.com`. Click on it, and you'll
    see your running Sencash app!

#### Step 2: Add your deploy hook for auto-updates

To get new releases, you will need to add your deploy hook to the app.

1. Click on the `maybe` "Web Service"
2. Click "Settings"
3. Scroll down to the end of the "Build and Deploy" section until you find the "
   Deploy Hook"
4. Copy this value
5. Open your new Sencash app, click your profile, click "Self Host Settings"
6. Paste your deploy hook in the settings and save
7. You're all set!

#### Step 3 (IMPORTANT!!!): Upgrade your Render services

By default, we set you up with a FREE Render web service and a FREE postgres
database. We do this for a few reasons:

- It allows you to take self-hosted Sencash for a FREE test-drive
- It prevents newcomers from incurring unexpected hosting charges

##### Upgrade your Database (REQUIRED)

All FREE Render databases **will be deleted after a few months**. This means
that **you will lose all of your Sencash data**.

**To avoid losing data, you MUST upgrade your Render database** (a "starter"
instance is $7/month)

You can upgrade your instance directly in the Render dashboard.

##### Upgrade your Web Service (RECOMMENDED)

All FREE Render web services use a small amount of memory and "sleep" after
periods of inactivity.

For the _fastest_ Sencash experience, you should upgrade your web service (a "
starter" instance is $7/month)
