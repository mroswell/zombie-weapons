Zombie Weapons is a Django project that has just enough functionality to exercise the features of Amazon Web Services (AWS), yet is simple enough to be easily understood.  

I built this project using an Ubuntu-based system, so if you're using something else (such as a Mac or Windows) then some instructions may need to be adjusted.  If you do need to make an adjustment, or if you notice an error, please submit a pull request - I would love to incorporate your feedback.  Feel free to contact me as well if you run into issues: jen@redmonocle.com.

Setup the AWS instances:

1. Create an AWS account, if you don't already have one.  You'll want to take a look at the details of the free usage tier at http://aws.amazon.com/free/.
2. Create a security group with full access to the SSH, HTTP, and MYSQL ports
3. Launch two EC2 instances.  
 a. Choose the 64-bit 'Amazon Linux AMI' that is available to the free trial - it will have a star next to it.  
 b. Be sure to create a Key Pair so that you can connect to your instance once it is launched.  You can find detailed instructions here: http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/
 c. This second instance is not included in the free trial, so you'll be charged for its usage. Leaving it on for an entire month will run you about $15.  Save money by stopping the instance when its not in use. 
6. Ensure that you can SSH into both instances.
 a. ssh -i <path to key> ec2-user@<instance dns name>

Prep your local:

1. git clone https://github.com/jrullmann/zombie-weapons.git
2. pip install fabric

Bootstrap the database server:

1. Follow the 'manually bootstrap database server' steps in this repository's fabfile.py.

Manully bootstrap the web server:

1. Follow the 'manully bootstrap web server' steps in this repository's fabfile.py.

Verify the site is running in your browser: http://<web server dns name/weapons/