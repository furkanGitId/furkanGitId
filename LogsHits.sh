 #!/usr/bin/env bash
 
echo 'Enter date (e.g. 01/Jan/2019): '
 
read date
 
echo ==========================================================================================
echo Checking for WP-Login Bruteforcing:
echo ==========================================================================================
grep -s $date /usr/local/apache/domlogs/* | grep wp-login.php |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail -20
echo ==========================================================================================
 
echo Checking for XMLRPC Abuse:
echo ==========================================================================================
grep -s $date /usr/local/apache/domlogs/* | grep xmlrpc |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail  -20
echo ==========================================================================================
 
echo Checking for Overly Active WP Heartbeat aka admin-ajax
echo ==========================================================================================
grep -s $date  /usr/local/apache/domlogs/* | grep admin-ajax |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail  -20
echo ==========================================================================================
 
echo Checking for Bot Traffic:
echo ==========================================================================================
grep -s $date  /usr/local/apache/domlogs/*  | grep "bot\|spider\|crawl" | awk {'print $6,$14'} | sort | uniq -c | sort -n | tail -25
echo ==========================================================================================
 
echo Checking for Sites Most Abused by Bots:
echo ==========================================================================================
grep -s $date  /usr/local/apache/domlogs/* | grep -i "BLEXBot\|Ahrefs\|MJ12bot\|SemrushBot\|Baiduspider\|Yandex\|Seznam\|DotBot\|spbot\|GrapeshotCrawler\|NetSeer"| awk {'print $1'} | cut -d: -f1| sort | uniq -c | sort -n
echo ==========================================================================================
 
echo Checking the Top Hits Per Site Per IP:
echo ==========================================================================================
grep -s $date  /usr/local/apache/domlogs/* | awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail -15
echo ==========================================================================================
 
echo Checking the IPs that Have Hit the Server Most and What Site:
echo ==========================================================================================
grep -s $date  /usr/local/apache/domlogs/* |  awk {'print $1'} | sort | uniq -c | sort -n | tail -25
echo ==========================================================================================
