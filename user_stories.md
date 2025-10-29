# User Stories

Break down the app's functionality into manageable, user-focused tasks that guide development.
Organize user stories with labels to help you quickly identify their purpose and priority. 

- Tab Navigation
    User can navigte between version 1 primary screens using bottom tabs, Predictions and Settings.
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
- User Authentication: signup and login
    Users that are not logged in will see a crown icon in the top right corner that can be tapped for upgrading their account (or purchasing credits if credits are implemented). Users that are signed in will see a user in a circle icon which, when tapped, will show a form allowing users to change their subscription (subscription users don't need credits).
        Credits, if implemented, are tied to a device and require a unique identifier for every device. It's probably better for privacy to generate a unique UUID for each device that gets "reset" when the app is deleted. **WARN USERS** that deleting the app will clear any credits they have and they need a subscription to cross installs or devices.
    Clicking on the top right icon loads a full screen modal that allows for either purchasing credits and/or subscribing to the app.
    Users can select a subscription to purchase which starts a modal-based wizard that first requires the user to register with an email address and password and then enter payment information for (Stripe API) payments for subscriptions.
        If there's an error during payment, the registration details will not be saved (simplifies handling cases where payment fails). Allows retrying new payment information or cancelling. User is notified if cancelling that the registration account was not created. On successful payment, user account is created and saved (remotely).
    Users with Free (Ads) accounts are allowed to purchase credits that require only payment information and no account registration. Credits are tied to installs on a device and get wiped if the app is deleted/removed. Credits cannot be reclaimed.
    Users that have registered and signed in are signed back in when the application loads, and never signed out until the user either deletes the app or manually signs out.
        Auth data must be cached and also verified with the remote data to validate active subscriptions.
        Users with subscriptions and failed payments are not allowed to purchase credits or generate images, and will have to fix their payment failure or sign out and watch ads.
        Alternatively, failed payment subscrption users can be forced to watch ads until they rectify their failed payment(s).
        **COMPLEXITY** Implementing logic to validate payments haven't failed and checking for failed payments to validate active subscriptions!
- Advertisements (Ad Mob via Firebase)
    Free (Ads) account users can generate images by first watching a (full screen modal) advertisement that lasts no longer than 30s and ideally 5-10s or less.
        Active subscription users do not watch ads before image generations.
        Subscription users with inactive subscriptions (or failed payment(s)) also watch ads before image generation, and are alerted to this happening before the advertisement.
- Credits and Subscriptions (use Stripe for payments)
    Users with Free (Ads) accounts can purchase credits or subscriptions by tapping the top right icon and following the modal wizard.
    Users with Pro (subscription) accounts cannot purchase credits but may be able to change (or cancel?) their subscription by tapping the top right icon and following the modal wizard.
    Users with credits spend 1 credit per generation, and when they run out of credits they go back to watching advertisements before image generations.
