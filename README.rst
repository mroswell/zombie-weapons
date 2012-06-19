Zombie Weapons is a Django project that has just enough features to exercise the features of Amazon Web Services (AWS), yet is simple enough to be easily understood.

If you're new to AWS, you'll need to do a little prep work:

1. Create an AWS account.  You'll want to take a look at the details of the free usage tier at http://aws.amazon.com/free/.
2. Launch an EC2 instance.  Choose the 64-bit Linux instance that is available to the free trial - it will have a star next to it.  Be sure to create a Key Pair so that you can connect to your instance once it is launched.  You can find detailed instructions here: http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/
3. Name the EC2 instance 'web'.
4. Launch another AWS instance, associate it with the same Key Pair, and name it 'db'.  This second instance is not included in the free trial, so you'll be charged for its usage.  Leaving it on for an entire month will run you about $15.  However, you can mitigate this by:
 a. Using the web server as your database server.  This project and its instructions assumes a seperate web and database server, but you can certainly combine the two.
 b. Stoping the database server when you're not using this project, since AWS only charges for the time the instance is on
5. Ensure that you can SSH to both instances

Next you'll want to prep your local:
1. Clone this repository to your local.  GitHub has great documentation if you're new to git: https://help.github.com/articles/set-up-git.  Feel free to contact me as well if you run into issues: jen@redmonocle.com.