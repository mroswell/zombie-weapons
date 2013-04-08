Zombie Weapons is a Django project that has just enough features to exercise the features of Amazon Web Services (AWS), yet is simple enough to be easily understood.  

I built this project using an Ubuntu-based system, so if you're using something else (such as a Mac or Windows) then some instructions may need to be adjusted.  If you do need to make an adjustment, or if you notice an error, please submit a pull request - I would love to incorporate your feedback.  Feel free to contact me as well if you run into issues: jen@redmonocle.com.

Setup the AWS instances:

1. Create an AWS account, if you don't already have one.  You'll want to take a look at the details of the free usage tier at http://aws.amazon.com/free/.
2. Launch an EC2 instance.  Choose the 64-bit 'Amazon Linux AMI' that is available to the free trial - it will have a star next to it.  Be sure to create a Key Pair so that you can connect to your instance once it is launched.  You can find detailed instructions here: http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/
3. Name the EC2 instance 'web'.
4. Launch another AWS instance, choose the same availability zone as your first instance, associate it with the same Key Pair, and name it 'db'.  This second instance is not included in the free trial, so you'll be charged for its usage.  Leaving it on for an entire month will run you about $15.  However, you can mitigate this by:
 a. Stoping the database server when you're not using this project, since AWS only charges for the time the instance is running.
 b. Using the web server as your database server.  This project and its instructions assumes a seperate web and database server, but you can certainly combine the two.
5. Edit the security group containing the two instances to allow inbound SSH, HTTP, and MYSQL connections 
6. Ensure that you can SSH to both instances.

Prep your local:

1. git clone https://github.com/jrullmann/zombie-weapons.git
2. mkvirtualenv zombie_weapons --no-site-packages
3. workon zombie_weapons
4. pip install -r requirements.txt
5. pip install fabric

Bootstrap the database server:

1. Follow the 'manually bootstrap database server' steps in this repositories fabfile.py.

Manully bootstrap web server:

1. Follow the 'manully bootstrap web server' steps in this repositories fabfile.py.