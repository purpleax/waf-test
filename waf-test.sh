URLTarget="$1"
SRCIP=`curl ifconfig.me`
echo "

-----------------------------------------------"
date
echo "URL target: $(tput setaf 3) https://$1 $(tput sgr 0)"
echo "Source IP: $(tput setaf 3) $SRCIP $(tput sgr 0)"
echo "-----------------------------------------------

"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36"

echo "$(tput setab 7) $(tput setaf 0)XSS 1 $(tput sgr 0)"
curl "https://$1//?a=%3Cscript%3Ealert%28%22XSS%22%29%3B%3C%2Fscript%3E&b=UNION+SELECT+ALL+FROM+information_schema+AND+%27+or+SLEEP%285%29+or+%27&c=..%2F..%2F..%2F..%2Fetc%2Fpasswd" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)XSS 2$(tput sgr 0)"

curl "https://$1/search?q=flowers+%3Cscript%3Eevil_script()%3C/script%3E" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar  -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)SQLi 1$(tput sgr 0)"

curl "https://$1/contacts?itemid=999%20or%201=1." \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)SQLi 2$(tput sgr 0)"

curl "https://$1/contacts?itemid=999;%20DROP%20TABLE%20Users" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar  -o/dev/null

echo "$(tput setab 7) $(tput setaf 0)Command Injection$(tput sgr 0)"

curl "https://$1/commandexec/example1.php?127.0.0.1;ls" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)File Inclusion$(tput sgr 0)"

curl "https://$1/fileincl/example.php?page=etc/passwd" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)Click Jacking$(tput sgr 0)"


curl "https://$1/?param=if(top+\u0021%3D+-%20self)+%7B+top.location%3Dself.location%3B+%7D%E2%80%9D%3E" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)HTML Injection$(tput sgr 0)"

curl "https://$1/news?user=%3Cimg%20src=%E2%80%99aaa%E2%80%99%20%20onerror=alert(1)%3E" \
  -H "authority: https://$1" \
  -H "pragma: no-cache" \
  -H "cache-control: no-cache" \
  -H "sec-ch-ua: $UA" \
  -H "sec-ch-ua-mobile: ?0" \
  -H "sec-ch-ua-platform: "macOS"" \
  -H "upgrade-insecure-requests: 1" \
  -H "user-agent: $UA" \
  -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
  -H "sec-fetch-site: none" \
  -H "sec-fetch-mode: navigate" \
  -H "sec-fetch-user: ?1" \
  -H "sec-fetch-dest: document" \
  -H "accept-language: en-GB,en-US;q=0.9,en;q=0.8" \
  --compressed --progress-bar -o /dev/null

echo "$(tput setab 7) $(tput setaf 0)And now for the BOTs$(tput sgr 0)"

echo "Nikto"
curl -A "Nikto" https://$1 --progress-bar  >/dev/null
echo "Nessus"
curl -A "Nessus" https://$1 --progress-bar  >/dev/null
echo "Masscan"
curl -A "Masscan" https://$1 --progress-bar  >/dev/null
echo "ApacheBench"
curl -A "ApacheBench/2.3" https://$1 --progress-bar  >/dev/null
echo "Shodan"
curl -A "Shodan" https://$1 --progress-bar >/dev/null
echo "Scrapy"
curl -A "Scrapy" https://$1 --progress-bar >/dev/null
echo "SQLWorm"
curl -A "Sqlworm" https://$1 --progress-bar >/dev/null
echo "ZoomBot"
curl -A "ZoomBot" https://$1 --progress-bar >/dev/null
echo "DiscoBot"
curl -A "Discobot" https://$1 --progress-bar >/dev/null
echo "Gigabot"
curl -A "Gigabot" https://$1 --progress-bar >/dev/null
