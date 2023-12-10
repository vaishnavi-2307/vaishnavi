/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
 var actionCodeSettings = { 
         url: 'https://@meta-academie.firebaseapp.com',
          iOS: {
              bundleId: 'com.example.metabizserv'
           },
          android: {
             packageName: 'com.example.metabizserv',
             installApp: true,
             minimumVersion: '12'
          },
          handleCodeInApp: true,
          dynamicLinkDomain: 'custom.page.link'
        };
exports.createAdmin = functions.https.onCall(async (data) => {
    try {
        const userRecord = await admin.auth()
            .createUser({
                email: data.email,
                password: data.password,
                displayName: data.firstName + " " + data.lastName,
            });
        console.log("Successfully created new user:", userRecord.uid);
        await admin
            .firestore()
            .collection("Admins")
            .doc(userRecord.uid)
            .set({
                "firstName": data.firstName,
                "lastName": data.lastName,
                "email": data.email,
                "isSuperAdmin": false,
            });
         
        await admin.auth().generatePasswordResetLink(data.email, actionCodeSettings);
        console.log("Successfully sent reset password:", data.email);
    } catch (error) {
        console.log(error);
        throw new functions.https.HttpsError("unavailable", "Email already in use.");
    }
});