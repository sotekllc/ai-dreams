# Issue Backlog

A list of prioritized user stories and issues that, after being completed, comprise (version 1) of a completed application. These issues are ordered by priority and later version EPICs are listed at the bottom.

- Tab Navigation
    User can navigte between version 1 primary screens using bottom tabs, Predictions and Settings.
- DotEnv environment handling setup
    Configure application to use multiple environments with the same environment variables.
- Backend Services Setup w/ DotEnv for Loading Secrets as Env Vars
    Prototype build will use `assets/.env.staging` and `assets/.env.prod` files for configuring each environment type.
    Env Vars will become remotely loaded secrets later on after developing the frontend prototype,
    except for JSON files (if we use Firebase) which will be loaded remotely or manually but not included with the source code.
    Select a backend choice: AWS, Firebase or Supabase; document the choice in an ADR.
    Setup Replicate and the initial prototype models, and store model information for the Generate page in the backend storage.
    Create the cloud function for loading the possible models for generation that reads from backend storage (don't directly access backend storage, use cloud functions!).
    Establish models/values for model information and load this data into the application.

    Users can view at least (4) models on the Generate page at the top of the screen and can select which model to run generations with.
    Users can click "generate prompt" and load a randomly generated prompt into the prompt form field using a text-to-text LLM generation.
- Device registration
    Devices must be "registered" via a generated UUID value to track advertisement and credit data with respect to a device. This is in alternative to using a device's specific device identifier and is more privacy respecting.
    **WARNING** Probably we should change this so that only logged in users can buy credits so they can't lose credits they've purchased. This means credits and subscriptions require registering an account.
- Predictions (Generations) Screen 
    User can select which (Stable Diffusion) model type to use for generations at the top of the Predictions Screen.
        Some models are restricted to subscribed users.
    User can type in a prompt for generating an image with the selected model type.
    User can click "generate prompt" to generate a random prompt for creating a (Stable Diffusion) image.
    User can click "generate" button to generate a single image for the selected model and given prompt, which transitions free users to a full screen advertistment before their generated image is displayed, whereas subscribed users are taken immediately to a loading screen before their image is displayed.
    User can browse example generated images along with their prompts, and tapping one of the examples loads the prompt into the prompt form field (but does not generate the image until "generate" is tapped).
    When there is an error loading an avertisement or an image, or no network is detected, a popup alert describes the error and allows users to retry the generation or cancel.
        If no network is detected, users are alerted and redirected back to the main predictions screen.
        If retrying only the image generation, the generation is retried and a loading screen shown with no (duplicate) advertisement.
    Users can save a recently generated image to their local device.
    Users can select 'redo' to retry generating an image with the same prompt as the previous image.
    Users can select 'edit prompt' to go back to the generation screen with the prompt in the prompt field for editing.
    Users can select 'cancel' to go back to the generations screen with no prompt in the prompt field.
- Settings Screen
    Users can view their account type in the Application section of the Settings Screen.
        Free (Ads), Pro (Subscription)
    Users can view their number of generation credits in the Application section of the Settings Screen.
    Users can toggle dark mode in the Application section of the Settings Screen.
    Users can toggle NSFW content and confirm their age 18+ or not in the Application section of the Settings Screen.
        When NSFW content is not enabled, any images with nudity will be blurred out or not returned and a message will indicate that the image contained NSFW content and was restricted. (Only adult users that enable NSFW content will see any such content, per the requirements of the App Store).
        Purity API will be used to detect nudity in images.
    Users that are logged in can Sign Out from the bottom of the Application section of the Settings Screen. Users that are not logged in will see the NSFW toggle as the last item in this section.
    In the Parameters section users can configure parameters for generated images, which may be model dependent:    resolution, ... TODO
- Advertisements (Ad Mob via Firebase)
    Free (Ads) account users can generate images by first watching a (full screen modal) advertisement that lasts no longer than 30s and ideally 5-10s or less.
        Active subscription users do not watch ads before image generations.
        Subscription users with inactive subscriptions (or failed payment(s)) also watch ads before image generation, and are alerted to this happening before the advertisement.
- Splash Screen and Launcher Icons
- Publish App on Apple and Google App Stores
    Version 1 with the simplified Cupertino based design will be launched on both app stores.
    Subsequent versions will involve an improved design, more model choices, that ability to run the app on desktop, and the ability to simply run local models by picking them and configuring the model run in the application.
- (v2) User Authentication: signup and login
    Users can click on the top right crown icon loads a full screen modal that allows for either purchasing credits and/or subscribing to the app once a user is logged in or registered for an account.
        Purchasing a subscription or credits with an account is and can be done after a using is logged into an account.
        Successfully registering or signing in will then load the modal displaying credits or subscriptions for purchase.
        Created accounts must validate their email address.
    Users can select a subscription to purchase which starts a modal-based wizard that first requires the user to register with an email address and password and then enter payment information for (Stripe API) payments for subscriptions.
        User accounts must be created successfully before payment can be accepted for any purchase.
    Users with Free (Ads) accounts are allowed to purchase credits that require only payment information and no account registration. Credits are tied to installs on a device and get wiped if the app is deleted/removed. Credits cannot be reclaimed.
    Users that have registered and signed in are signed back in when the application loads, and never signed out until the user either deletes the app or manually signs out.
        Auth data must be cached and also verified with the remote data to validate active subscriptions.
        Users with subscriptions and failed payments are not allowed to purchase credits or generate images, and will have to fix their payment failure or sign out and watch ads.
        Alternatively, failed payment subscrption users can be forced to watch ads until they rectify their failed payment(s).
        **COMPLEXITY** Implementing logic to validate payments haven't failed and checking for failed payments to validate active subscriptions!
- (v2) Credits and Subscriptions (use Stripe for payments)
    Users with Free (Ads) accounts can purchase credits or subscriptions by tapping the top right icon and following the modal wizard.
    Users with Pro (subscription) accounts cannot purchase credits but may be able to change (or cancel?) their subscription by tapping the top right icon and following the modal wizard.
    Users with credits spend 1 credit per generation, and when they run out of credits they go back to watching advertisements before image generations.
- (v3) Desktop app that also enables loading and running locally stored models