# namecheap-bash-ddns
This is a pretty simple shell script that updates a Namecheap DDNS record. 
## Usage
`./ddns-update.sh <host> <domain.tld> <ddns_password>`  

For example:  

`./ddns-update.sh mymachine mydomain.com mysuperlongpasswordblahblah1234`
  
This script doesn't loop; it checks if the current WAN IP is the same as the IP in the DDNS record and if they don't match, it updates the record and exits. So if you want it to loop endlessly, add it to the crontab and set whatever interval you like. I did this so you don't have to edit the script if you don't like how often it refreshes. If you've never used the crontab to automate stuff before, you can find a very in-depth tutorial [here](https://crontabjob.com/how-to-add-crontab-jobs-in-linux-unix/).  

If you need help setting up DDNS or finding your password for it, [this page](https://www.namecheap.com/support/knowledgebase/article.aspx/595/11/how-do-i-enable-dynamic-dns-for-a-domain/) walks you through it.  
## Assumption
I figured that anyone using this script will be someone who has some Linux machine at their house and wants it to update the IP of a DDNS record. Given this, the script uses the WAN IP of the machine and ensures that IP is what's stored in the DDNS entry. So if you're trying to run this on a remote machine, then you'll have to do some minor tweaking. [This page](https://www.namecheap.com/support/knowledgebase/article.aspx/29/11/how-do-i-use-a-browser-to-dynamically-update-the-hosts-ip/) explains the process in detail. If you're trying to put a different IP than your current one into the DDNS record, look at the optional &ip= parameter at the end.
## Notice
This script only works with A records (IPv4). 
