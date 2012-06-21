Zombie Weapons is a Django project that has just enough features to exercise the features of Amazon Web Services (AWS), yet is simple enough to be easily understood.  

I built this project using an Ubuntu-based system, so if you're using something else (such as a Mac or Windows) then some instructions may need to be adjusted.  If you do need to make an adjustment, or if you notice an error, please submit a pull request - I would love to incorporate your feedback.  Feel free to contact me as well if you run into issues: jen@redmonocle.com.

If you're new to AWS, you'll need to do a little prep work:

1. Create an AWS account.  You'll want to take a look at the details of the free usage tier at http://aws.amazon.com/free/.
2. Launch an EC2 instance.  Choose the 64-bit 'Amazon Linux AMI' that is available to the free trial - it will have a star next to it.  Be sure to create a Key Pair so that you can connect to your instance once it is launched.  You can find detailed instructions here: http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/
3. Name the EC2 instance 'web'.
4. Launch another AWS instance, choose the same availability zone as your first instance, associate it with the same Key Pair, and name it 'db'.  This second instance is not included in the free trial, so you'll be charged for its usage.  Leaving it on for an entire month will run you about $15.  However, you can mitigate this by:
 a. Stoping the database server when you're not using this project, since AWS only charges for the time the instance is running.
 b. Using the web server as your database server.  This project and its instructions assumes a seperate web and database server, but you can certainly combine the two.
5. Ensure that you can SSH to both instances.

Next you'll want to prep your local:

1. Clone this repository to your local.  GitHub has great documentation if you're new to git: https://help.github.com/articles/set-up-git.
2. Optional: Play with zombie weapons on your local: http://127.0.0.1:8000/weapons/.  Select household items on the left to see your zombie-battling weapon options on the right.  Access the admin console with username admin and password admin to update new options.
 a. git clone https://github.com/jrullmann/zombie-weapons.git
 b. mkvirtualenv zombie_weapons --no-site-packages
 c. workon zombie_weapons
 d. pip install -r requirements.txt
3. Install fabric.  This project uses fabric to deploy to AWS.  Fabric is available on the Ubuntu repository, and also through pip and easy_install.  More info at http://fabfile.org.

You can see copy/paste the commands executed here: https://docs.google.com/document/d/1mbOdifkLg0lNnXbpZrG-j_QXLj6SeOjwVNyHhU9F2ao/edit