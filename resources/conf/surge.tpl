#!MANAGED-CONFIG {$userapiUrl}

[General]
loglevel = notify
dns-server = system, 119.29.29.29, 223.6.6.6, 80.80.80.80
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, localhost, *.local, *.crashlytics.com
external-controller-access = MixChina@0.0.0.0:8233
allow-wifi-access = true
enhanced-mode-by-rule = false
exclude-simple-hostnames = true
ipv6 = true
replica = false
{if $surge == 3}
http-listen = 0.0.0.0:8234
socks5-listen = 0.0.0.0:8235
internet-test-url = http://baidu.com
proxy-test-url = http://bing.com
test-timeout = 3
{else}
interface = 0.0.0.0
socks-interface = 0.0.0.0
port = 8234
socks-port = 8235
{/if}

[Replica]
hide-apple-request = true
hide-crashlytics-request = true
hide-udp = false
use-keyword-filter = false

[Proxy]
🚀 Direct = direct
{$proxy_group}

[Proxy Group]

🍃 Proxy = select, 🍈 Select, 🏃 Auto, 🚀 Direct

🍂 Domestic = select, 🚀 Direct, 🍃 Proxy

☁️ Others = select, 🍃 Proxy, 🚀 Direct

🍎 Only = select, 🚀 Direct, 🍃 Proxy

🍈 Select = select{$proxy_name}

🏃 Auto = url-test{$proxy_name}, url = http://www.gstatic.com/generate_204, interval = 1200

[Rule]
{if $surge == 3}
RULE-SET,https://raw.githubusercontent.com/lhie1/Rules/master/Surge3/apple.list,🍎 Only
RULE-SET,https://raw.githubusercontent.com/lhie1/Rules/master/Surge3/proxy.list,🍃 Proxy
RULE-SET,https://raw.githubusercontent.com/lhie1/Rules/master/Surge3/domestic.list,🍂 Domestic
RULE-SET,SYSTEM,DIRECT
{else}
# Apple

URL-REGEX,*apple.com/cn,🍎 Only

PROCESS-NAME,storedownloadd,🍎 Only

USER-AGENT,%E5%9C%B0%E5%9B%BE*,🍎 Only
USER-AGENT,%E8%AE%BE%E7%BD%AE*,🍎 Only
USER-AGENT,*com.apple.mobileme.fmip1,🍎 Only
USER-AGENT,*WeatherFoundation*,🍎 Only
USER-AGENT,*AssistantServices*,🍎 Only
USER-AGENT,MobileAsset*,🍎 Only
USER-AGENT,Siri*,🍎 Only

USER-AGENT,cloudd*,🍎 Only
USER-AGENT,com.apple.appstored*,🍎 Only
USER-AGENT,com.apple.geod*,🍎 Only
USER-AGENT,com.apple.Maps,🍎 Only
USER-AGENT,FindMyFriends*,🍎 Only
USER-AGENT,FindMyiPhone*,🍎 Only
USER-AGENT,FMDClient*,🍎 Only
USER-AGENT,FMFD*,🍎 Only
USER-AGENT,fmflocatord*,🍎 Only
USER-AGENT,geod*,🍎 Only
USER-AGENT,locationd*,🍎 Only
USER-AGENT,Maps*,🍎 Only

DOMAIN,guzzoni.apple.com,🍎 Only
DOMAIN-SUFFIX,aaplimg.com,🍎 Only
DOMAIN-SUFFIX,apple.co,🍎 Only
DOMAIN-SUFFIX,apple.com,🍎 Only
DOMAIN-SUFFIX,apple-cloudkit.com,🍎 Only
DOMAIN-SUFFIX,cdn-apple.com,🍎 Only
DOMAIN-SUFFIX,icloud.com,🍎 Only
DOMAIN-SUFFIX,icloud-content.com,🍎 Only
DOMAIN-SUFFIX,itunes.apple.com,🍎 Only
DOMAIN-SUFFIX,itunes.com,🍎 Only
DOMAIN-SUFFIX,lookup-api.apple.com,🍎 Only
DOMAIN-SUFFIX,me.com,🍎 Only
DOMAIN-SUFFIX,mzstatic.com,🍎 Only

# PROXY

// Client
PROCESS-NAME,Backup and Sync,🍃 Proxy
PROCESS-NAME,Day One,🍃 Proxy
PROCESS-NAME,Dropbox,🍃 Proxy
PROCESS-NAME,LINE,🍃 Proxy
PROCESS-NAME,node-webkit,🍃 Proxy
PROCESS-NAME,Resilio Sync,🍃 Proxy
PROCESS-NAME,Spotify,🍃 Proxy
PROCESS-NAME,Tweetbot,🍃 Proxy
PROCESS-NAME,Twitter,🍃 Proxy
PROCESS-NAME,Twitterrific,🍃 Proxy
PROCESS-NAME,viu,🍃 Proxy

// UA
USER-AGENT,%E7%BA%BD%E7%BA%A6%E6%97%B6%E6%8A%A5*,🍃 Proxy
USER-AGENT,AwemeI18n*,🍃 Proxy
USER-AGENT,Coinbase*,🍃 Proxy
USER-AGENT,Instagram*,🍃 Proxy
USER-AGENT,Resilio Sync*,🍃 Proxy
USER-AGENT,SoundCloud*,🍃 Proxy
USER-AGENT,viu*,🍃 Proxy
USER-AGENT,WeMusic*,🍃 Proxy

// BBC
USER-AGENT,BBCiPlayer*,🍃 Proxy
DOMAIN-KEYWORD,co.uk,🍃 Proxy
DOMAIN-KEYWORD,uk-live,🍃 Proxy
DOMAIN-SUFFIX,bbc.co,🍃 Proxy
DOMAIN-SUFFIX,bbc.com,🍃 Proxy

// CHOCO TV
USER-AGENT,TwDramas,🍃 Proxy
DOMAIN-SUFFIX,chocotv.com.tw,🍃 Proxy

// Epicgames
DOMAIN-KEYWORD,epicgames,🍃 Proxy
DOMAIN-SUFFIX,helpshift.com,🍃 Proxy

// Hulu
DOMAIN-SUFFIX,hulu.com,🍃 Proxy

// Line
DOMAIN-SUFFIX,lin.ee,🍃 Proxy
DOMAIN-SUFFIX,line.me,🍃 Proxy
DOMAIN-SUFFIX,line.naver.jp,🍃 Proxy
DOMAIN-SUFFIX,line-apps.com,🍃 Proxy
DOMAIN-SUFFIX,line-cdn.net,🍃 Proxy
DOMAIN-SUFFIX,line-scdn.net,🍃 Proxy
DOMAIN-SUFFIX,nhncorp.jp,🍃 Proxy

// MytvSUPER
DOMAIN-KEYWORD,nowtv100,🍃 Proxy
DOMAIN-KEYWORD,rthklive,🍃 Proxy
DOMAIN-SUFFIX,mytvsuper.com,🍃 Proxy
DOMAIN-SUFFIX,tvb.com,🍃 Proxy

// Microsoft
USER-AGENT,OneDrive*,🍃 Proxy

DOMAIN-KEYWORD,microsoft,🍃 Proxy
DOMAIN-SUFFIX,hotmail.com,🍃 Proxy
DOMAIN-SUFFIX,live.com,🍃 Proxy
DOMAIN-SUFFIX,live.net,🍃 Proxy
DOMAIN-SUFFIX,msn.com,🍃 Proxy
DOMAIN-SUFFIX,office.com,🍃 Proxy
DOMAIN-SUFFIX,office.net,🍃 Proxy
DOMAIN-SUFFIX,outlook.com,🍃 Proxy

// Netflix
DOMAIN-SUFFIX,netflix.com,🍃 Proxy
DOMAIN-SUFFIX,netflix.net,🍃 Proxy
DOMAIN-SUFFIX,nflxext.com,🍃 Proxy
DOMAIN-SUFFIX,nflximg.com,🍃 Proxy
DOMAIN-SUFFIX,nflximg.net,🍃 Proxy
DOMAIN-SUFFIX,nflxvideo.net,🍃 Proxy

// Spark
DOMAIN-SUFFIX,api.amplitude.com,🍃 Proxy
DOMAIN-SUFFIX,app.smartmailcloud.com,🍃 Proxy
DOMAIN-SUFFIX,gate.hockeyapp.net,🍃 Proxy
DOMAIN-SUFFIX,smartmailcloud.com,🍃 Proxy

// Steam
DOMAIN-SUFFIX,fanatical.com,🍃 Proxy
DOMAIN-SUFFIX,humblebundle.com,🍃 Proxy
DOMAIN-SUFFIX,steamcommunity.com,🍃 Proxy
DOMAIN-SUFFIX,steampowered.com,🍃 Proxy
DOMAIN-SUFFIX,steamstatic.com,🍃 Proxy

// WeMusic
DOMAIN-KEYWORD,joox,🍃 Proxy

// Top blocked sites
DOMAIN-SUFFIX,2o7.net,🍃 Proxy
DOMAIN-SUFFIX,4everProxy.com,🍃 Proxy
DOMAIN-SUFFIX,4shared.com,🍃 Proxy
DOMAIN-SUFFIX,4sqi.net,🍃 Proxy
DOMAIN-SUFFIX,9to5mac.com,🍃 Proxy
DOMAIN-SUFFIX,abpchina.org,🍃 Proxy
DOMAIN-SUFFIX,accountkit.com,🍃 Proxy
DOMAIN-SUFFIX,adblockplus.org,🍃 Proxy
DOMAIN-SUFFIX,adobe.com,🍃 Proxy
DOMAIN-SUFFIX,adobedtm.com,🍃 Proxy
DOMAIN-SUFFIX,aerisapi.com,🍃 Proxy
DOMAIN-SUFFIX,akamaihd.net,🍃 Proxy
DOMAIN-SUFFIX,alibaba.com,🍃 Proxy
DOMAIN-SUFFIX,alibabacloud.com,🍃 Proxy
DOMAIN-SUFFIX,alfredapp.com,🍃 Proxy
DOMAIN-SUFFIX,allconnected.co,🍃 Proxy
DOMAIN-SUFFIX,amazon.com,🍃 Proxy
DOMAIN-SUFFIX,amazonaws.com,🍃 Proxy
DOMAIN-SUFFIX,ampproject.com,🍃 Proxy
DOMAIN-SUFFIX,ampproject.net,🍃 Proxy
DOMAIN-SUFFIX,ampproject.org,🍃 Proxy
DOMAIN-SUFFIX,ancsconf.org,🍃 Proxy
DOMAIN-SUFFIX,android.com,🍃 Proxy
DOMAIN-SUFFIX,androidify.com,🍃 Proxy
DOMAIN-SUFFIX,android-x86.org,🍃 Proxy
DOMAIN-SUFFIX,angularjs.org,🍃 Proxy
DOMAIN-SUFFIX,anthonycalzadilla.com,🍃 Proxy
DOMAIN-SUFFIX,aol.com,🍃 Proxy
DOMAIN-SUFFIX,aolcdn.com,🍃 Proxy
DOMAIN-SUFFIX,api.mixpanel.com,🍃 Proxy
DOMAIN-SUFFIX,api.tiktokv.com,🍃 Proxy
DOMAIN-SUFFIX,api.urbandictionary.com,🍃 Proxy
DOMAIN-SUFFIX,apigee.com,🍃 Proxy
DOMAIN-SUFFIX,apk-dl.com,🍃 Proxy
DOMAIN-SUFFIX,apkpure.com,🍃 Proxy
DOMAIN-SUFFIX,appdownloader.net,🍃 Proxy
DOMAIN-SUFFIX,apple-dns.net,🍃 Proxy
DOMAIN-SUFFIX,app-measurement.com,🍃 Proxy
DOMAIN-SUFFIX,appshopper.com,🍃 Proxy
DOMAIN-SUFFIX,arcgis.com,🍃 Proxy
DOMAIN-SUFFIX,archive.is,🍃 Proxy
DOMAIN-SUFFIX,archive.org,🍃 Proxy
DOMAIN-SUFFIX,archives.gov,🍃 Proxy
DOMAIN-SUFFIX,armorgames.com,🍃 Proxy
DOMAIN-SUFFIX,aspnetcdn.com,🍃 Proxy
DOMAIN-SUFFIX,async.be,🍃 Proxy
DOMAIN-SUFFIX,att.com,🍃 Proxy
DOMAIN-SUFFIX,avgle.com,🍃 Proxy
DOMAIN-SUFFIX,awsstatic.com,🍃 Proxy
DOMAIN-SUFFIX,azureedge.net,🍃 Proxy
DOMAIN-SUFFIX,azurewebsites.net,🍃 Proxy
DOMAIN-SUFFIX,badoo.com,🍃 Proxy
DOMAIN-SUFFIX,bandisoft.com,🍃 Proxy
DOMAIN-SUFFIX,bbtoystore.com,🍃 Proxy
DOMAIN-SUFFIX,betvictor.com,🍃 Proxy
DOMAIN-SUFFIX,bigsound.org,🍃 Proxy
DOMAIN-SUFFIX,bing.com,🍃 Proxy
DOMAIN-SUFFIX,bing.net,🍃 Proxy
DOMAIN-SUFFIX,bintray.com,🍃 Proxy
DOMAIN-SUFFIX,bit.com,🍃 Proxy
DOMAIN-SUFFIX,bit.do,🍃 Proxy
DOMAIN-SUFFIX,bit.ly,🍃 Proxy
DOMAIN-SUFFIX,bitbucket.org,🍃 Proxy
DOMAIN-SUFFIX,bitcointalk.org,🍃 Proxy
DOMAIN-SUFFIX,bitshare.com,🍃 Proxy
DOMAIN-SUFFIX,bkrtx.com,🍃 Proxy
DOMAIN-SUFFIX,blizzard.com,🍃 Proxy
DOMAIN-SUFFIX,blog.com,🍃 Proxy
DOMAIN-SUFFIX,blogcdn.com,🍃 Proxy
DOMAIN-SUFFIX,blogger.com,🍃 Proxy
DOMAIN-SUFFIX,bloglovin.com,🍃 Proxy
DOMAIN-SUFFIX,blogsmithmedia.com,🍃 Proxy
DOMAIN-SUFFIX,blogspot.hk,🍃 Proxy
DOMAIN-SUFFIX,bloomberg.cn,🍃 Proxy
DOMAIN-SUFFIX,bloomberg.com,🍃 Proxy
DOMAIN-SUFFIX,books.com.tw,🍃 Proxy
DOMAIN-SUFFIX,boomtrain.com,🍃 Proxy
DOMAIN-SUFFIX,box.com,🍃 Proxy
DOMAIN-SUFFIX,box.net,🍃 Proxy
DOMAIN-SUFFIX,boxun.com,🍃 Proxy
DOMAIN-SUFFIX,cachefly.net,🍃 Proxy
DOMAIN-SUFFIX,cbc.ca,🍃 Proxy
DOMAIN-SUFFIX,cdn.segment.com,🍃 Proxy
DOMAIN-SUFFIX,cdnst.net,🍃 Proxy
DOMAIN-SUFFIX,celestrak.com,🍃 Proxy
DOMAIN-SUFFIX,census.gov,🍃 Proxy
DOMAIN-SUFFIX,certificate-transparency.org,🍃 Proxy
DOMAIN-SUFFIX,chinatimes.com,🍃 Proxy
DOMAIN-SUFFIX,chrome.com,🍃 Proxy
DOMAIN-SUFFIX,chromecast.com,🍃 Proxy
DOMAIN-SUFFIX,chromercise.com,🍃 Proxy
DOMAIN-SUFFIX,chromestatus.com,🍃 Proxy
DOMAIN-SUFFIX,chromium.org,🍃 Proxy
DOMAIN-SUFFIX,cl.ly,🍃 Proxy
DOMAIN-SUFFIX,cloudflare.com,🍃 Proxy
DOMAIN-SUFFIX,cloudfront.net,🍃 Proxy
DOMAIN-SUFFIX,cloudgarage.jp,🍃 Proxy
DOMAIN-SUFFIX,cloudmagic.com,🍃 Proxy
DOMAIN-SUFFIX,cmail19.com,🍃 Proxy
DOMAIN-SUFFIX,cnet.com,🍃 Proxy
DOMAIN-SUFFIX,cnn.com,🍃 Proxy
DOMAIN-SUFFIX,cocoapods.org,🍃 Proxy
DOMAIN-SUFFIX,comodoca.com,🍃 Proxy
DOMAIN-SUFFIX,content.office.net,🍃 Proxy
DOMAIN-SUFFIX,culturedcode.com ,🍃 Proxy
DOMAIN-SUFFIX,cygames.jp ,🍃 Proxy
DOMAIN-SUFFIX,d.pr,🍃 Proxy
DOMAIN-SUFFIX,danilo.to,🍃 Proxy
DOMAIN-SUFFIX,daolan.net,🍃 Proxy
DOMAIN-SUFFIX,data-vocabulary.org,🍃 Proxy
DOMAIN-SUFFIX,dayone.me,🍃 Proxy
DOMAIN-SUFFIX,db.tt,🍃 Proxy
DOMAIN-SUFFIX,dcmilitary.com,🍃 Proxy
DOMAIN-SUFFIX,deja.com,🍃 Proxy
DOMAIN-SUFFIX,demdex.net,🍃 Proxy
DOMAIN-SUFFIX,deskconnect.com,🍃 Proxy
DOMAIN-SUFFIX,digicert.com,🍃 Proxy
DOMAIN-SUFFIX,digisfera.com,🍃 Proxy
DOMAIN-SUFFIX,digitaltrends.com,🍃 Proxy
DOMAIN-SUFFIX,disconnect.me,🍃 Proxy
DOMAIN-SUFFIX,disq.us,🍃 Proxy
DOMAIN-SUFFIX,disqus.com,🍃 Proxy
DOMAIN-SUFFIX,disquscdn.com,🍃 Proxy
DOMAIN-SUFFIX,dmm.co.jp,🍃 Proxy
DOMAIN-SUFFIX,dnsimple.com,🍃 Proxy
DOMAIN-SUFFIX,docker.com,🍃 Proxy
DOMAIN-SUFFIX,doub.io,🍃 Proxy
DOMAIN-SUFFIX,dribbble.com,🍃 Proxy
DOMAIN-SUFFIX,droplr.com,🍃 Proxy
DOMAIN-SUFFIX,duckduckgo.com,🍃 Proxy
DOMAIN-SUFFIX,dueapp.com,🍃 Proxy
DOMAIN-SUFFIX,dw.com,🍃 Proxy
DOMAIN-SUFFIX,easybib.com,🍃 Proxy
DOMAIN-SUFFIX,economist.com,🍃 Proxy
DOMAIN-SUFFIX,edgecastcdn.net,🍃 Proxy
DOMAIN-SUFFIX,edgekey.net,🍃 Proxy
DOMAIN-SUFFIX,edgesuite.net,🍃 Proxy
DOMAIN-SUFFIX,engadget.com,🍃 Proxy
DOMAIN-SUFFIX,entrust.net,🍃 Proxy
DOMAIN-SUFFIX,eurekavpt.com,🍃 Proxy
DOMAIN-SUFFIX,evernote.com,🍃 Proxy
DOMAIN-SUFFIX,extmatrix.com,🍃 Proxy
DOMAIN-SUFFIX,eyny.com,🍃 Proxy
DOMAIN-SUFFIX,fabric.io,🍃 Proxy
DOMAIN-SUFFIX,fast.com,🍃 Proxy
DOMAIN-SUFFIX,fastly.net,🍃 Proxy
DOMAIN-SUFFIX,fastmail.com,🍃 Proxy
DOMAIN-SUFFIX,fc2.com,🍃 Proxy
DOMAIN-SUFFIX,feedburner.com,🍃 Proxy
DOMAIN-SUFFIX,feedly.com,🍃 Proxy
DOMAIN-SUFFIX,feedsportal.com,🍃 Proxy
DOMAIN-SUFFIX,fiftythree.com,🍃 Proxy
DOMAIN-SUFFIX,firebaseio.com,🍃 Proxy
DOMAIN-SUFFIX,flexibits.com,🍃 Proxy
DOMAIN-SUFFIX,flickr.com,🍃 Proxy
DOMAIN-SUFFIX,flipboard.com,🍃 Proxy
DOMAIN-SUFFIX,flipkart.com,🍃 Proxy
DOMAIN-SUFFIX,flitto.com,🍃 Proxy
DOMAIN-SUFFIX,flurry.com,🍃 Proxy
DOMAIN-SUFFIX,freeopenProxy.com,🍃 Proxy
DOMAIN-SUFFIX,fullstory.com,🍃 Proxy
DOMAIN-SUFFIX,fzlm.net,🍃 Proxy
DOMAIN-SUFFIX,g.co,🍃 Proxy
DOMAIN-SUFFIX,gabia.net,🍃 Proxy
DOMAIN-SUFFIX,garena.com,🍃 Proxy
DOMAIN-SUFFIX,gameloft.com,🍃 Proxy
DOMAIN-SUFFIX,geni.us,🍃 Proxy
DOMAIN-SUFFIX,get.how,🍃 Proxy
DOMAIN-SUFFIX,getcloudapp.com,🍃 Proxy
DOMAIN-SUFFIX,getfoxyProxy.org,🍃 Proxy
DOMAIN-SUFFIX,getlantern.org,🍃 Proxy
DOMAIN-SUFFIX,getmdl.io,🍃 Proxy
DOMAIN-SUFFIX,getpricetag.com,🍃 Proxy
DOMAIN-SUFFIX,gfw.press,🍃 Proxy
DOMAIN-SUFFIX,gfx.ms,🍃 Proxy
DOMAIN-SUFFIX,ggpht.com,🍃 Proxy
DOMAIN-SUFFIX,ghostnoteapp.com,🍃 Proxy
DOMAIN-SUFFIX,git.io,🍃 Proxy
DOMAIN-SUFFIX,gitbook.com,🍃 Proxy
DOMAIN-SUFFIX,globalsign.com,🍃 Proxy
DOMAIN-SUFFIX,gmocloud.com,🍃 Proxy
DOMAIN-SUFFIX,gmodules.com,🍃 Proxy
DOMAIN-SUFFIX,go.com,🍃 Proxy
DOMAIN-SUFFIX,go.jp,🍃 Proxy
DOMAIN-SUFFIX,godaddy.com,🍃 Proxy
DOMAIN-SUFFIX,golang.org,🍃 Proxy
DOMAIN-SUFFIX,gongm.in,🍃 Proxy
DOMAIN-SUFFIX,goo.gl,🍃 Proxy
DOMAIN-SUFFIX,goodreaders.com,🍃 Proxy
DOMAIN-SUFFIX,goodreads.com,🍃 Proxy
DOMAIN-SUFFIX,gravatar.com,🍃 Proxy
DOMAIN-SUFFIX,gstatic.cn,🍃 Proxy
DOMAIN-SUFFIX,gstatic.com,🍃 Proxy
DOMAIN-SUFFIX,gunsamerica.com,🍃 Proxy
DOMAIN-SUFFIX,gvt0.com,🍃 Proxy
DOMAIN-SUFFIX,gvt1.com,🍃 Proxy
DOMAIN-SUFFIX,helpshift.com,🍃 Proxy
DOMAIN-SUFFIX,hinet.net,🍃 Proxy
DOMAIN-SUFFIX,hockeyapp.net,🍃 Proxy
DOMAIN-SUFFIX,homedepot.com,🍃 Proxy
DOMAIN-SUFFIX,hootsuite.com,🍃 Proxy
DOMAIN-SUFFIX,howtoforge.com,🍃 Proxy
DOMAIN-SUFFIX,iam.soy,🍃 Proxy
DOMAIN-SUFFIX,icoco.com,🍃 Proxy
DOMAIN-SUFFIX,icons8.com,🍃 Proxy
DOMAIN-SUFFIX,ift.tt,🍃 Proxy
DOMAIN-SUFFIX,ifttt.com,🍃 Proxy
DOMAIN-SUFFIX,imageshack.us,🍃 Proxy
DOMAIN-SUFFIX,img.ly,🍃 Proxy
DOMAIN-SUFFIX,imgur.com,🍃 Proxy
DOMAIN-SUFFIX,imore.com,🍃 Proxy
DOMAIN-SUFFIX,ingress.com ,🍃 Proxy
DOMAIN-SUFFIX,insder.co,🍃 Proxy
DOMAIN-SUFFIX,instapaper.com,🍃 Proxy
DOMAIN-SUFFIX,instructables.com,🍃 Proxy
DOMAIN-SUFFIX,io.io,🍃 Proxy
DOMAIN-SUFFIX,ip.sb,🍃 Proxy
DOMAIN-SUFFIX,ipaddress.com,🍃 Proxy
DOMAIN-SUFFIX,ipn.li,🍃 Proxy
DOMAIN-SUFFIX,is.gd,🍃 Proxy
DOMAIN-SUFFIX,ishowsapp.com,🍃 Proxy
DOMAIN-SUFFIX,issuu.com,🍃 Proxy
DOMAIN-SUFFIX,itgonglun.com,🍃 Proxy
DOMAIN-SUFFIX,itun.es,🍃 Proxy
DOMAIN-SUFFIX,ixquick.com,🍃 Proxy
DOMAIN-SUFFIX,j.mp,🍃 Proxy
DOMAIN-SUFFIX,javbus.com,🍃 Proxy
DOMAIN-SUFFIX,js.revsci.net,🍃 Proxy
DOMAIN-SUFFIX,jshint.com,🍃 Proxy
DOMAIN-SUFFIX,jtvnw.net,🍃 Proxy
DOMAIN-SUFFIX,justgetflux.com,🍃 Proxy
DOMAIN-SUFFIX,kakao.co.kr,🍃 Proxy
DOMAIN-SUFFIX,kakao.com,🍃 Proxy
DOMAIN-SUFFIX,kakaocdn.net,🍃 Proxy
DOMAIN-SUFFIX,kat.cr,🍃 Proxy
DOMAIN-SUFFIX,kenengba.com,🍃 Proxy
DOMAIN-SUFFIX,kik.com,🍃 Proxy
DOMAIN-SUFFIX,klip.me,🍃 Proxy
DOMAIN-SUFFIX,leancloud.com,🍃 Proxy
DOMAIN-SUFFIX,leetcode.com,🍃 Proxy
DOMAIN-SUFFIX,lhie1.com,🍃 Proxy
DOMAIN-SUFFIX,libsyn.com,🍃 Proxy
DOMAIN-SUFFIX,licdn.com,🍃 Proxy
DOMAIN-SUFFIX,lightboxcdn.com,🍃 Proxy
DOMAIN-SUFFIX,like.com,🍃 Proxy
DOMAIN-SUFFIX,linkedin.com,🍃 Proxy
DOMAIN-SUFFIX,linode.com,🍃 Proxy
DOMAIN-SUFFIX,lithium.com,🍃 Proxy
DOMAIN-SUFFIX,littlehj.com,🍃 Proxy
DOMAIN-SUFFIX,livefilestore.com,🍃 Proxy
DOMAIN-SUFFIX,llnwd.net,🍃 Proxy
DOMAIN-SUFFIX,localnetwork.uop,🍃 Proxy
DOMAIN-SUFFIX,logmein.com,🍃 Proxy
DOMAIN-SUFFIX,macid.co,🍃 Proxy
DOMAIN-SUFFIX,macromedia.com,🍃 Proxy
DOMAIN-SUFFIX,macrumors.com,🍃 Proxy
DOMAIN-SUFFIX,manhuaren.com,🍃 Proxy
DOMAIN-SUFFIX,marketwatch.com,🍃 Proxy
DOMAIN-SUFFIX,mashable.com,🍃 Proxy
DOMAIN-SUFFIX,mathjax.org,🍃 Proxy
DOMAIN-SUFFIX,medium.com,🍃 Proxy
DOMAIN-SUFFIX,mega.co.nz,🍃 Proxy
DOMAIN-SUFFIX,mega.nz,🍃 Proxy
DOMAIN-SUFFIX,megaupload.com,🍃 Proxy
DOMAIN-SUFFIX,microsofttranslator.com,🍃 Proxy
DOMAIN-SUFFIX,mindnode.com,🍃 Proxy
DOMAIN-SUFFIX,mlssoccer.com,🍃 Proxy
DOMAIN-SUFFIX,mobile01.com,🍃 Proxy
DOMAIN-SUFFIX,modmyi.com,🍃 Proxy
DOMAIN-SUFFIX,moves-export.com,🍃 Proxy
DOMAIN-SUFFIX,mp3buscador.com,🍃 Proxy
DOMAIN-SUFFIX,msedge.net,🍃 Proxy
DOMAIN-SUFFIX,mycnnews.com,🍃 Proxy
DOMAIN-SUFFIX,myfontastic.com,🍃 Proxy
DOMAIN-SUFFIX,name.com,🍃 Proxy
DOMAIN-SUFFIX,nasa.gov,🍃 Proxy
DOMAIN-SUFFIX,ndr.de,🍃 Proxy
DOMAIN-SUFFIX,netdna-cdn.com,🍃 Proxy
DOMAIN-SUFFIX,newipnow.com,🍃 Proxy
DOMAIN-SUFFIX,nextmedia.com,🍃 Proxy
DOMAIN-SUFFIX,nih.gov,🍃 Proxy
DOMAIN-SUFFIX,nintendo.com,🍃 Proxy
DOMAIN-SUFFIX,nintendo.net,🍃 Proxy
DOMAIN-SUFFIX,notion.so,🍃 Proxy
DOMAIN-SUFFIX,novafile.com,🍃 Proxy
DOMAIN-SUFFIX,nrk.no,🍃 Proxy
DOMAIN-SUFFIX,nsstatic.net,🍃 Proxy
DOMAIN-SUFFIX,nssurge.com,🍃 Proxy
DOMAIN-SUFFIX,nyt.com,🍃 Proxy
DOMAIN-SUFFIX,nytimes.com,🍃 Proxy
DOMAIN-SUFFIX,nytimg.com,🍃 Proxy
DOMAIN-SUFFIX,nytstyle.com,🍃 Proxy
DOMAIN-SUFFIX,office365.com,🍃 Proxy
DOMAIN-SUFFIX,omnigroup.com,🍃 Proxy
DOMAIN-SUFFIX,onedrive.com,🍃 Proxy
DOMAIN-SUFFIX,onedrive.live.com,🍃 Proxy
DOMAIN-SUFFIX,onenote.com,🍃 Proxy
DOMAIN-SUFFIX,ooyala.com,🍃 Proxy
DOMAIN-SUFFIX,openvpn.net,🍃 Proxy
DOMAIN-SUFFIX,openwrt.org,🍃 Proxy
DOMAIN-SUFFIX,optimizely.com,🍃 Proxy
DOMAIN-SUFFIX,orkut.com,🍃 Proxy
DOMAIN-SUFFIX,osha.gov,🍃 Proxy
DOMAIN-SUFFIX,osxdaily.com,🍃 Proxy
DOMAIN-SUFFIX,ow.ly,🍃 Proxy
DOMAIN-SUFFIX,paddle.com,🍃 Proxy
DOMAIN-SUFFIX,paddleapi.com,🍃 Proxy
DOMAIN-SUFFIX,pandora.com,🍃 Proxy
DOMAIN-SUFFIX,panoramio.com,🍃 Proxy
DOMAIN-SUFFIX,parallels.com,🍃 Proxy
DOMAIN-SUFFIX,parse.com,🍃 Proxy
DOMAIN-SUFFIX,pdfexpert.com,🍃 Proxy
DOMAIN-SUFFIX,periscope.tv,🍃 Proxy
DOMAIN-SUFFIX,piaotian.net,🍃 Proxy
DOMAIN-SUFFIX,picacomic.com,🍃 Proxy
DOMAIN-SUFFIX,picasaweb.com,🍃 Proxy
DOMAIN-SUFFIX,pinboard.in,🍃 Proxy
DOMAIN-SUFFIX,ping.pe,🍃 Proxy
DOMAIN-SUFFIX,pinterest.com,🍃 Proxy
DOMAIN-SUFFIX,pixelmator.com,🍃 Proxy
DOMAIN-SUFFIX,pixiv.net,🍃 Proxy
DOMAIN-SUFFIX,pixnet.net,🍃 Proxy
DOMAIN-SUFFIX,playpcesor.com,🍃 Proxy
DOMAIN-SUFFIX,playstation.com,🍃 Proxy
DOMAIN-SUFFIX,playstation.com.hk,🍃 Proxy
DOMAIN-SUFFIX,playstation.net,🍃 Proxy
DOMAIN-SUFFIX,playstationnetwork.com,🍃 Proxy
DOMAIN-SUFFIX,pokemon.com,🍃 Proxy
DOMAIN-SUFFIX,polymer-project.org,🍃 Proxy
DOMAIN-SUFFIX,popo.tw,🍃 Proxy
DOMAIN-SUFFIX,potato.im,🍃 Proxy
DOMAIN-SUFFIX,prfct.co,🍃 Proxy
DOMAIN-SUFFIX,proxfree.com,🍃 Proxy
DOMAIN-SUFFIX,psiphon3.com,🍃 Proxy
DOMAIN-SUFFIX,ptt.cc,🍃 Proxy
DOMAIN-SUFFIX,pubu.com.tw,🍃 Proxy
DOMAIN-SUFFIX,puffinbrowser.com,🍃 Proxy
DOMAIN-SUFFIX,pushbullet.com,🍃 Proxy
DOMAIN-SUFFIX,pushwoosh.com,🍃 Proxy
DOMAIN-SUFFIX,pximg.net,🍃 Proxy
DOMAIN-SUFFIX,quora.com,🍃 Proxy
DOMAIN-SUFFIX,quoracdn.net,🍃 Proxy
DOMAIN-SUFFIX,readingtimes.com.tw,🍃 Proxy
DOMAIN-SUFFIX,readmoo.com,🍃 Proxy
DOMAIN-SUFFIX,recaptcha.net,🍃 Proxy
DOMAIN-SUFFIX,reddit.com,🍃 Proxy
DOMAIN-SUFFIX,redditmedia.com,🍃 Proxy
DOMAIN-SUFFIX,reuters.com,🍃 Proxy
DOMAIN-SUFFIX,rfi.fr,🍃 Proxy
DOMAIN-SUFFIX,rileyguide.com,🍃 Proxy
DOMAIN-SUFFIX,rime.im,🍃 Proxy
DOMAIN-SUFFIX,rsf.org,🍃 Proxy
DOMAIN-SUFFIX,sciencedaily.com,🍃 Proxy
DOMAIN-SUFFIX,sciencemag.org,🍃 Proxy
DOMAIN-SUFFIX,scribd.com,🍃 Proxy
DOMAIN-SUFFIX,search.com,🍃 Proxy
DOMAIN-SUFFIX,servebom.com,🍃 Proxy
DOMAIN-SUFFIX,sfx.ms,🍃 Proxy
DOMAIN-SUFFIX,shadowsocks.org,🍃 Proxy
DOMAIN-SUFFIX,shadowverse.jp,🍃 Proxy
DOMAIN-SUFFIX,sharethis.com,🍃 Proxy
DOMAIN-SUFFIX,shazam.com,🍃 Proxy
DOMAIN-SUFFIX,shutterstock.com,🍃 Proxy
DOMAIN-SUFFIX,sidelinesnews.com,🍃 Proxy
DOMAIN-SUFFIX,simp.ly,🍃 Proxy
DOMAIN-SUFFIX,simplenote.com,🍃 Proxy
DOMAIN-SUFFIX,sketchappsources.com,🍃 Proxy
DOMAIN-SUFFIX,skype.com,🍃 Proxy
DOMAIN-SUFFIX,slack.com,🍃 Proxy
DOMAIN-SUFFIX,slack-edge.com,🍃 Proxy
DOMAIN-SUFFIX,slack-msgs.com,🍃 Proxy
DOMAIN-SUFFIX,slideshare.net,🍃 Proxy
DOMAIN-SUFFIX,smartdnsproxy.com,🍃 Proxy
DOMAIN-SUFFIX,smh.com.au,🍃 Proxy
DOMAIN-SUFFIX,snapchat.com,🍃 Proxy
DOMAIN-SUFFIX,sndcdn.com,🍃 Proxy
DOMAIN-SUFFIX,sockslist.net,🍃 Proxy
DOMAIN-SUFFIX,sony.com,🍃 Proxy
DOMAIN-SUFFIX,sony.com.hk,🍃 Proxy
DOMAIN-SUFFIX,sonyentertainmentnetwork.com,🍃 Proxy
DOMAIN-SUFFIX,soundcloud.com,🍃 Proxy
DOMAIN-SUFFIX,sourceforge.net,🍃 Proxy
DOMAIN-SUFFIX,sowers.org.hk,🍃 Proxy
DOMAIN-SUFFIX,speedsmart.net,🍃 Proxy
DOMAIN-SUFFIX,spike.com,🍃 Proxy
DOMAIN-SUFFIX,squarespace.com,🍃 Proxy
DOMAIN-SUFFIX,ssa.gov,🍃 Proxy
DOMAIN-SUFFIX,sstatic.net,🍃 Proxy
DOMAIN-SUFFIX,st.luluku.pw,🍃 Proxy
DOMAIN-SUFFIX,stackoverflow.com,🍃 Proxy
DOMAIN-SUFFIX,starp2p.com,🍃 Proxy
DOMAIN-SUFFIX,startpage.com,🍃 Proxy
DOMAIN-SUFFIX,state.gov,🍃 Proxy
DOMAIN-SUFFIX,staticflickr.com,🍃 Proxy
DOMAIN-SUFFIX,storify.com,🍃 Proxy
DOMAIN-SUFFIX,stumbleupon.com,🍃 Proxy
DOMAIN-SUFFIX,sugarsync.com,🍃 Proxy
DOMAIN-SUFFIX,supermariorun.com,🍃 Proxy
DOMAIN-SUFFIX,surfeasy.com.au,🍃 Proxy
DOMAIN-SUFFIX,surge.run,🍃 Proxy
DOMAIN-SUFFIX,surrenderat20.net,🍃 Proxy
DOMAIN-SUFFIX,sydneytoday.com,🍃 Proxy
DOMAIN-SUFFIX,symauth.com,🍃 Proxy
DOMAIN-SUFFIX,symcb.com,🍃 Proxy
DOMAIN-SUFFIX,symcd.com,🍃 Proxy
DOMAIN-SUFFIX,t.me,🍃 Proxy
DOMAIN-SUFFIX,t66y.com,🍃 Proxy
DOMAIN-SUFFIX,tablesgenerator.com,🍃 Proxy
DOMAIN-SUFFIX,tabtter.jp,🍃 Proxy
DOMAIN-SUFFIX,talk853.com,🍃 Proxy
DOMAIN-SUFFIX,talkboxapp.com,🍃 Proxy
DOMAIN-SUFFIX,talkonly.net,🍃 Proxy
DOMAIN-SUFFIX,tapbots.com,🍃 Proxy
DOMAIN-SUFFIX,tapbots.net,🍃 Proxy
DOMAIN-SUFFIX,tdesktop.com,🍃 Proxy
DOMAIN-SUFFIX,techcrunch.com,🍃 Proxy
DOMAIN-SUFFIX,technorati.com,🍃 Proxy
DOMAIN-SUFFIX,techsmith.com,🍃 Proxy
DOMAIN-SUFFIX,teddysun.com,🍃 Proxy
DOMAIN-SUFFIX,telegra.ph,🍃 Proxy
DOMAIN-SUFFIX,textnow.me,🍃 Proxy
DOMAIN-SUFFIX,thebobs.com,🍃 Proxy
DOMAIN-SUFFIX,theinitium.com,🍃 Proxy
DOMAIN-SUFFIX,thepiratebay.org,🍃 Proxy
DOMAIN-SUFFIX,theverge.com,🍃 Proxy
DOMAIN-SUFFIX,thewgo.org,🍃 Proxy
DOMAIN-SUFFIX,tiltbrush.com,🍃 Proxy
DOMAIN-SUFFIX,time.com,🍃 Proxy
DOMAIN-SUFFIX,timeinc.net,🍃 Proxy
DOMAIN-SUFFIX,tinder.com,🍃 Proxy
DOMAIN-SUFFIX,tiny.cc,🍃 Proxy
DOMAIN-SUFFIX,tinychat.com,🍃 Proxy
DOMAIN-SUFFIX,tinypic.com,🍃 Proxy
DOMAIN-SUFFIX,tmblr.co,🍃 Proxy
DOMAIN-SUFFIX,todoist.com,🍃 Proxy
DOMAIN-SUFFIX,togetter.com,🍃 Proxy
DOMAIN-SUFFIX,tokyocn.com,🍃 Proxy
DOMAIN-SUFFIX,tomshardware.com,🍃 Proxy
DOMAIN-SUFFIX,torcn.com,🍃 Proxy
DOMAIN-SUFFIX,torrentprivacy.com,🍃 Proxy
DOMAIN-SUFFIX,torrentproject.se,🍃 Proxy
DOMAIN-SUFFIX,torrentz.eu,🍃 Proxy
DOMAIN-SUFFIX,traffichaus.com,🍃 Proxy
DOMAIN-SUFFIX,trakt.tv,🍃 Proxy
DOMAIN-SUFFIX,transparency.org,🍃 Proxy
DOMAIN-SUFFIX,trello.com,🍃 Proxy
DOMAIN-SUFFIX,trendsmap.com,🍃 Proxy
DOMAIN-SUFFIX,trulyergonomic.com,🍃 Proxy
DOMAIN-SUFFIX,trustasiassl.com,🍃 Proxy
DOMAIN-SUFFIX,tt-rss.org,🍃 Proxy
DOMAIN-SUFFIX,ttvnw.net,🍃 Proxy
DOMAIN-SUFFIX,tumblr.co,🍃 Proxy
DOMAIN-SUFFIX,tumblr.com,🍃 Proxy
DOMAIN-SUFFIX,turbobit.net,🍃 Proxy
DOMAIN-SUFFIX,tv.com,🍃 Proxy
DOMAIN-SUFFIX,tweetdeck.com,🍃 Proxy
DOMAIN-SUFFIX,tweetmarker.net,🍃 Proxy
DOMAIN-SUFFIX,twimg.co,🍃 Proxy
DOMAIN-SUFFIX,twitch.tv,🍃 Proxy
DOMAIN-SUFFIX,twitthat.com,🍃 Proxy
DOMAIN-SUFFIX,twtkr.com,🍃 Proxy
DOMAIN-SUFFIX,twttr.com,🍃 Proxy
DOMAIN-SUFFIX,txmblr.com,🍃 Proxy
DOMAIN-SUFFIX,typcn.com,🍃 Proxy
DOMAIN-SUFFIX,typekit.net,🍃 Proxy
DOMAIN-SUFFIX,typography.com,🍃 Proxy
DOMAIN-SUFFIX,ubertags.com,🍃 Proxy
DOMAIN-SUFFIX,ublock.org,🍃 Proxy
DOMAIN-SUFFIX,ubnt.com,🍃 Proxy
DOMAIN-SUFFIX,uchicago.edu,🍃 Proxy
DOMAIN-SUFFIX,udn.com,🍃 Proxy
DOMAIN-SUFFIX,ugo.com,🍃 Proxy
DOMAIN-SUFFIX,uhdwallpapers.org,🍃 Proxy
DOMAIN-SUFFIX,ulyssesapp.com,🍃 Proxy
DOMAIN-SUFFIX,unblockdmm.com,🍃 Proxy
DOMAIN-SUFFIX,unblocksites.co,🍃 Proxy
DOMAIN-SUFFIX,unpo.org,🍃 Proxy
DOMAIN-SUFFIX,unsplash.com,🍃 Proxy
DOMAIN-SUFFIX,untraceable.us,🍃 Proxy
DOMAIN-SUFFIX,uploaded.net,🍃 Proxy
DOMAIN-SUFFIX,uProxy.org,🍃 Proxy
DOMAIN-SUFFIX,upwork.com,🍃 Proxy
DOMAIN-SUFFIX,urchin.com,🍃 Proxy
DOMAIN-SUFFIX,urlparser.com,🍃 Proxy
DOMAIN-SUFFIX,us.to,🍃 Proxy
DOMAIN-SUFFIX,usertrust.com,🍃 Proxy
DOMAIN-SUFFIX,usgs.gov,🍃 Proxy
DOMAIN-SUFFIX,usma.edu,🍃 Proxy
DOMAIN-SUFFIX,uspto.gov,🍃 Proxy
DOMAIN-SUFFIX,ustream.tv,🍃 Proxy
DOMAIN-SUFFIX,v.gd,🍃 Proxy
DOMAIN-SUFFIX,v2ray.com,🍃 Proxy
DOMAIN-SUFFIX,van001.com,🍃 Proxy
DOMAIN-SUFFIX,vanpeople.com,🍃 Proxy
DOMAIN-SUFFIX,vansky.com,🍃 Proxy
DOMAIN-SUFFIX,vbstatic.co,🍃 Proxy
DOMAIN-SUFFIX,venchina.com,🍃 Proxy
DOMAIN-SUFFIX,venturebeat.com,🍃 Proxy
DOMAIN-SUFFIX,veoh.com,🍃 Proxy
DOMAIN-SUFFIX,verizonwireless.com,🍃 Proxy
DOMAIN-SUFFIX,viber.com,🍃 Proxy
DOMAIN-SUFFIX,vid.me,🍃 Proxy
DOMAIN-SUFFIX,videomega.tv,🍃 Proxy
DOMAIN-SUFFIX,vidinfo.org,🍃 Proxy
DOMAIN-SUFFIX,vimeo.com,🍃 Proxy
DOMAIN-SUFFIX,vimeocdn.com,🍃 Proxy
DOMAIN-SUFFIX,vimperator.org,🍃 Proxy
DOMAIN-SUFFIX,vine.co,🍃 Proxy
DOMAIN-SUFFIX,visibletweets.com,🍃 Proxy
DOMAIN-SUFFIX,viu.com,🍃 Proxy
DOMAIN-SUFFIX,vivaldi.com,🍃 Proxy
DOMAIN-SUFFIX,voachinese.com,🍃 Proxy
DOMAIN-SUFFIX,vocativ.com,🍃 Proxy
DOMAIN-SUFFIX,vox-cdn.com,🍃 Proxy
DOMAIN-SUFFIX,vpnaccount.org,🍃 Proxy
DOMAIN-SUFFIX,vpnbook.com,🍃 Proxy
DOMAIN-SUFFIX,vpngate.net,🍃 Proxy
DOMAIN-SUFFIX,vsco.co,🍃 Proxy
DOMAIN-SUFFIX,vultr.com,🍃 Proxy
DOMAIN-SUFFIX,vzw.com,🍃 Proxy
DOMAIN-SUFFIX,w.org,🍃 Proxy
DOMAIN-SUFFIX,w3schools.com,🍃 Proxy
DOMAIN-SUFFIX,wattpad.com,🍃 Proxy
DOMAIN-SUFFIX,web2project.net,🍃 Proxy
DOMAIN-SUFFIX,webfreer.com,🍃 Proxy
DOMAIN-SUFFIX,weblagu.com,🍃 Proxy
DOMAIN-SUFFIX,websnapr.com,🍃 Proxy
DOMAIN-SUFFIX,webtype.com,🍃 Proxy
DOMAIN-SUFFIX,webwarper.net,🍃 Proxy
DOMAIN-SUFFIX,wenxuecity.com,🍃 Proxy
DOMAIN-SUFFIX,westca.com,🍃 Proxy
DOMAIN-SUFFIX,westpoint.edu,🍃 Proxy
DOMAIN-SUFFIX,whatbrowser.org,🍃 Proxy
DOMAIN-SUFFIX,wikileaks.info,🍃 Proxy
DOMAIN-SUFFIX,wikileaks.org,🍃 Proxy
DOMAIN-SUFFIX,wikileaks-forum.com,🍃 Proxy
DOMAIN-SUFFIX,wikimedia.org,🍃 Proxy
DOMAIN-SUFFIX,wikipedia.com,🍃 Proxy
DOMAIN-SUFFIX,wikipedia.org,🍃 Proxy
DOMAIN-SUFFIX,windows.com,🍃 Proxy
DOMAIN-SUFFIX,windows.net,🍃 Proxy
DOMAIN-SUFFIX,wn.com,🍃 Proxy
DOMAIN-SUFFIX,wordpress.com,🍃 Proxy
DOMAIN-SUFFIX,workflow.is,🍃 Proxy
DOMAIN-SUFFIX,worldcat.org,🍃 Proxy
DOMAIN-SUFFIX,wow.com,🍃 Proxy
DOMAIN-SUFFIX,wp.com,🍃 Proxy
DOMAIN-SUFFIX,wsj.com,🍃 Proxy
DOMAIN-SUFFIX,wsj.net,🍃 Proxy
DOMAIN-SUFFIX,wwitv.com,🍃 Proxy
DOMAIN-SUFFIX,xanga.com,🍃 Proxy
DOMAIN-SUFFIX,xclient.info,🍃 Proxy
DOMAIN-SUFFIX,xda-developers.com,🍃 Proxy
DOMAIN-SUFFIX,xeeno.com,🍃 Proxy
DOMAIN-SUFFIX,xiti.com,🍃 Proxy
DOMAIN-SUFFIX,xuite.net,🍃 Proxy
DOMAIN-SUFFIX,xvideos.com,🍃 Proxy
DOMAIN-SUFFIX,yahoo.com,🍃 Proxy
DOMAIN-SUFFIX,yahooapis.com,🍃 Proxy
DOMAIN-SUFFIX,yasni.co.uk,🍃 Proxy
DOMAIN-SUFFIX,yastatic.net,🍃 Proxy
DOMAIN-SUFFIX,yeeyi.com,🍃 Proxy
DOMAIN-SUFFIX,yesasia.com,🍃 Proxy
DOMAIN-SUFFIX,yes-news.com,🍃 Proxy
DOMAIN-SUFFIX,yidio.com,🍃 Proxy
DOMAIN-SUFFIX,yimg.com,🍃 Proxy
DOMAIN-SUFFIX,ying.com,🍃 Proxy
DOMAIN-SUFFIX,yorkbbs.ca,🍃 Proxy
DOMAIN-SUFFIX,youmaker.com,🍃 Proxy
DOMAIN-SUFFIX,yourlisten.com,🍃 Proxy
DOMAIN-SUFFIX,youtu.be,🍃 Proxy
DOMAIN-SUFFIX,yoyo.org,🍃 Proxy
DOMAIN-SUFFIX,ytimg.com,🍃 Proxy
DOMAIN-SUFFIX,zacebook.com,🍃 Proxy
DOMAIN-SUFFIX,zalmos.com,🍃 Proxy
DOMAIN-SUFFIX,zaobao.com.sg,🍃 Proxy
DOMAIN-SUFFIX,zeutch.com,🍃 Proxy
DOMAIN-SUFFIX,zynamics.com,🍃 Proxy

// Force some domains which are fucked by GFW while resolving DNS,or do not respect the system Proxy
DOMAIN-KEYWORD,appledaily,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,beetalk,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,blogspot,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,dropbox,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,facebook,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,github,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,porn,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,spotify,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,telegram,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,twitter,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,whatsapp,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,youtube,🍃 Proxy,force-remote-dns
DOMAIN-KEYWORD,google,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,1e100.net,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,2mdn.net,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,abc.xyz,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,akamai.net,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,appspot.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,autodraw.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,bandwagonhost.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,blogblog.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,cdninstagram.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,chromeexperiments.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,creativelab5.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,crittercism.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,culturalspot.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,dartlang.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,fb.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,fb.me,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,fbcdn.net,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,fbsbx.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,gcr.io,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,gmail.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,gosetsuden.jp,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,gvt1.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,gwtproject.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,heroku.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,html5rocks.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,instagram.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,keyhole.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,kobo.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,kobobooks.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,madewithcode.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,material.io,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,messenger.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,netmarble.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,nianticlabs.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,pinimg.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,pubnub.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,scdn.co,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,t.co,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,tensorflow.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,toggleable.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,torproject.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,twimg.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,twitpic.com,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,unfiltered.news,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,waveprotocol.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,webmproject.org,🍃 Proxy,force-remote-dns
DOMAIN-SUFFIX,webrtc.org,🍃 Proxy,force-remote-dns

// Amazon
IP-CIDR,13.32.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,13.33.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,13.35.0.0/17,🍃 Proxy,no-resolve
IP-CIDR,18.184.0.0/15,🍃 Proxy,no-resolve
IP-CIDR,18.194.0.0/15,🍃 Proxy,no-resolve
IP-CIDR,18.208.0.0/13,🍃 Proxy,no-resolve
IP-CIDR,18.232.0.0/14,🍃 Proxy,no-resolve
IP-CIDR,52.200.0.0/13,🍃 Proxy,no-resolve
IP-CIDR,52.58.0.0/15,🍃 Proxy,no-resolve
IP-CIDR,52.74.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,52.77.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,52.84.0.0/15,🍃 Proxy,no-resolve
IP-CIDR,54.156.0.0/14,🍃 Proxy,no-resolve
IP-CIDR,54.226.0.0/15,🍃 Proxy,no-resolve
IP-CIDR,54.230.156.0/22,🍃 Proxy,no-resolve
IP-CIDR,54.93.0.0/16,🍃 Proxy,no-resolve

// Facebook
IP-CIDR,103.4.96.0/22,🍃 Proxy,no-resolve
IP-CIDR,129.134.0.0/17,🍃 Proxy,no-resolve
IP-CIDR,157.240.0.0/17,🍃 Proxy,no-resolve
IP-CIDR,173.252.64.0/19,🍃 Proxy,no-resolve
IP-CIDR,173.252.96.0/19,🍃 Proxy,no-resolve
IP-CIDR,179.60.192.0/22,🍃 Proxy,no-resolve
IP-CIDR,185.60.216.0/22,🍃 Proxy,no-resolve
IP-CIDR,204.15.20.0/22,🍃 Proxy,no-resolve
IP-CIDR,31.13.24.0/21,🍃 Proxy,no-resolve
IP-CIDR,31.13.64.0/18,🍃 Proxy,no-resolve
IP-CIDR,45.64.40.0/22,🍃 Proxy,no-resolve
IP-CIDR,66.220.144.0/20,🍃 Proxy,no-resolve
IP-CIDR,69.171.224.0/19,🍃 Proxy,no-resolve
IP-CIDR,69.63.176.0/20,🍃 Proxy,no-resolve
IP-CIDR,74.119.76.0/22,🍃 Proxy,no-resolve

// Google
IP-CIDR,173.194.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,74.125.0.0/16,🍃 Proxy,no-resolve

// Kakao Talk
IP-CIDR,1.201.0.0/24,🍃 Proxy,no-resolve
IP-CIDR,103.246.56.0/22,🍃 Proxy,no-resolve
IP-CIDR,103.27.148.0/22,🍃 Proxy,no-resolve
IP-CIDR,110.76.140.0/22,🍃 Proxy,no-resolve
IP-CIDR,113.61.104.0/22,🍃 Proxy,no-resolve
IP-CIDR,27.0.236.0/22,🍃 Proxy,no-resolve

// LINE
IP-CIDR,103.2.28.0/22,🍃 Proxy,no-resolve
IP-CIDR,119.235.224.0/21,🍃 Proxy,no-resolve
IP-CIDR,119.235.232.0/23,🍃 Proxy,no-resolve
IP-CIDR,119.235.235.0/24,🍃 Proxy,no-resolve
IP-CIDR,119.235.236.0/23,🍃 Proxy,no-resolve
IP-CIDR,125.6.146.0/24,🍃 Proxy,no-resolve
IP-CIDR,125.6.149.0/24,🍃 Proxy,no-resolve
IP-CIDR,125.6.190.0/24,🍃 Proxy,no-resolve
IP-CIDR,125.209.208.0/20,🍃 Proxy,no-resolve
IP-CIDR,203.104.103.0/24,🍃 Proxy,no-resolve
IP-CIDR,203.104.128.0/20,🍃 Proxy,no-resolve
IP-CIDR,203.174.66.64/26,🍃 Proxy,no-resolve
IP-CIDR,203.174.77.0/24,🍃 Proxy,no-resolve

// Potato Chat
IP-CIDR,13.251.24.157/24,🍃 Proxy,no-resolve
IP-CIDR,13.251.41.203/24,🍃 Proxy,no-resolve
IP-CIDR,17.252.156.147/24,🍃 Proxy,no-resolve
IP-CIDR,17.252.157.26/24,🍃 Proxy,no-resolve

// SoftLayer
IP-CIDR,74.86.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,75.126.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,174.37.0.0/16,🍃 Proxy,no-resolve
IP-CIDR,208.43.0.0/16,🍃 Proxy,no-resolve

// Telegram
IP-CIDR,109.239.140.0/24,🍃 Proxy,no-resolve
IP-CIDR,149.154.160.0/20,🍃 Proxy,no-resolve
IP-CIDR,149.154.164.0/22,🍃 Proxy,no-resolve
IP-CIDR,149.154.168.0/22,🍃 Proxy,no-resolve
IP-CIDR,149.154.172.0/22,🍃 Proxy,no-resolve
IP-CIDR,91.108.4.0/22,🍃 Proxy,no-resolve
IP-CIDR,91.108.56.0/22,🍃 Proxy,no-resolve
IP-CIDR,91.108.8.0/22,🍃 Proxy,no-resolve

# DIRECT

// Client
PROCESS-NAME,Paws for Trello,🍂 Domestic
PROCESS-NAME,ss-local,🍂 Domestic
PROCESS-NAME,Thunder,🍂 Domestic
PROCESS-NAME,TeamViewer,🍂 Domestic
PROCESS-NAME,trustd,🍂 Domestic
PROCESS-NAME,WebTorrent,🍂 Domestic
PROCESS-NAME,WeChat,🍂 Domestic

// UA
USER-AGENT, %E4%BA%AC%E4%B8%9C%E5%88%B0%E5%AE%B6*,🍂 Domestic
USER-AGENT,%E5%8D%B3%E5%88%BB*,🍂 Domestic
USER-AGENT,*Vainglory* ,🍂 Domestic
USER-AGENT,AdBlock*,🍂 Domestic
USER-AGENT,arrowio*,🍂 Domestic
USER-AGENT,balls*,🍂 Domestic
USER-AGENT,Beplay*,🍂 Domestic
USER-AGENT,Best%20Trace*,🍂 Domestic
USER-AGENT,cmblife*,🍂 Domestic
USER-AGENT,eusoft_ting_en_iphone,🍂 Domestic
USER-AGENT,hide*,🍂 Domestic
USER-AGENT,JDLife*,🍂 Domestic
USER-AGENT,LastPass*,🍂 Domestic
USER-AGENT,MegaWerewolf*,🍂 Domestic
USER-AGENT,MicroMessenger*,🍂 Domestic
USER-AGENT,Microsoft*,🍂 Domestic
USER-AGENT,Moke*,🍂 Domestic
USER-AGENT,osee2unifiedRelease*,🍂 Domestic
USER-AGENT,PayPal*,🍂 Domestic
USER-AGENT,QQ*,🍂 Domestic
USER-AGENT,Speedtest*,🍂 Domestic
USER-AGENT,TeamViewer*,🍂 Domestic
USER-AGENT,TIM*,🍂 Domestic
USER-AGENT,ting_en,🍂 Domestic
USER-AGENT,WebTorrent*,🍂 Domestic
USER-AGENT,WeChat*,🍂 Domestic

// Beplay
DOMAIN-KEYWORD,beplay,🍂 Domestic

// Blizzard
USER-AGENT,Blizzard*,🍂 Domestic
USER-AGENT,wowcompanion*,🍂 Domestic
DOMAIN-SUFFIX,battle.net,🍂 Domestic
DOMAIN-SUFFIX,battlenet.com,🍂 Domestic
DOMAIN-SUFFIX,blizzard.com,🍂 Domestic

// Prior
DOMAIN,client.amplifi.com,🍂 Domestic

// iStat Menu IP Test
DOMAIN,ip.bjango.com,🍂 Domestic

DOMAIN-SUFFIX,alphassl.com,🍂 Domestic
DOMAIN-SUFFIX,edu.cn,🍂 Domestic

// Steam
DOMAIN-SUFFIX,steamcontent.com,🍂 Domestic

// TeamViewer
IP-CIDR,139.220.243.27/32,🍂 Domestic,no-resolve
IP-CIDR,172.16.102.56/32,🍂 Domestic,no-resolve
IP-CIDR,185.188.32.1/28,🍂 Domestic,no-resolve
IP-CIDR,221.226.128.146/32,🍂 Domestic,no-resolve

DOMAIN-SUFFIX,cn,🍂 Domestic

DOMAIN-SUFFIX,12306.com,🍂 Domestic
DOMAIN-SUFFIX,126.net,🍂 Domestic
DOMAIN-SUFFIX,163.com,🍂 Domestic
DOMAIN-SUFFIX,360.cn,🍂 Domestic
DOMAIN-SUFFIX,360.com,🍂 Domestic
DOMAIN-SUFFIX,360buy.com,🍂 Domestic
DOMAIN-SUFFIX,360buyimg.com,🍂 Domestic
DOMAIN-SUFFIX,36kr.com,🍂 Domestic
DOMAIN-SUFFIX,51ym.me,🍂 Domestic
DOMAIN-SUFFIX,58.com,🍂 Domestic
DOMAIN-SUFFIX,8686c.com,🍂 Domestic
DOMAIN-SUFFIX,abercrombie.com,🍂 Domestic
DOMAIN-SUFFIX,acfun.tv,🍂 Domestic
DOMAIN-SUFFIX,acgvideo.com,🍂 Domestic
DOMAIN-SUFFIX,adobesc.com,🍂 Domestic
DOMAIN-SUFFIX,air-matters.com,🍂 Domestic
DOMAIN-SUFFIX,air-matters.io,🍂 Domestic
DOMAIN-SUFFIX,airtable.com,🍂 Domestic
DOMAIN-SUFFIX,aixifan.com,🍂 Domestic
DOMAIN-SUFFIX,akadns.net,🍂 Domestic
DOMAIN-SUFFIX,alicdn.com,🍂 Domestic
DOMAIN-SUFFIX,alipay.com,🍂 Domestic
DOMAIN-SUFFIX,alipayobjects.com,🍂 Domestic
DOMAIN-SUFFIX,aliyun.com,🍂 Domestic
DOMAIN-SUFFIX,amap.com,🍂 Domestic
DOMAIN-SUFFIX,apache.org,🍂 Domestic
DOMAIN-SUFFIX,api.crisp.chat,🍂 Domestic
DOMAIN-SUFFIX,api.termius.com,🍂 Domestic
DOMAIN-SUFFIX,appshike.com,🍂 Domestic
DOMAIN-SUFFIX,appstore.com,🍂 Domestic
DOMAIN-SUFFIX,autonavi.com,🍂 Domestic
DOMAIN-SUFFIX,aweme.snssdk.com,🍂 Domestic
DOMAIN-SUFFIX,bababian.com,🍂 Domestic
DOMAIN-SUFFIX,baidu.com,🍂 Domestic
DOMAIN-SUFFIX,battle.net,🍂 Domestic
DOMAIN-SUFFIX,bdimg.com,🍂 Domestic
DOMAIN-SUFFIX,bdstatic.com,🍂 Domestic
DOMAIN-SUFFIX,beatsbydre.com,🍂 Domestic
DOMAIN-SUFFIX,bet365.com,🍂 Domestic
DOMAIN-SUFFIX,bilibili.cn,🍂 Domestic
DOMAIN-SUFFIX,bilibili.com,🍂 Domestic
DOMAIN-SUFFIX,caiyunapp.com,🍂 Domestic
DOMAIN-SUFFIX,ccgslb.com,🍂 Domestic
DOMAIN-SUFFIX,ccgslb.net,🍂 Domestic
DOMAIN-SUFFIX,chinacache.net,🍂 Domestic
DOMAIN-SUFFIX,chunbo.com,🍂 Domestic
DOMAIN-SUFFIX,chunboimg.com,🍂 Domestic
DOMAIN-SUFFIX,clashroyaleapp.com,🍂 Domestic
DOMAIN-SUFFIX,clouddn.com,🍂 Domestic
DOMAIN-SUFFIX,cloudsigma.com,🍂 Domestic
DOMAIN-SUFFIX,cloudxns.net,🍂 Domestic
DOMAIN-SUFFIX,cmfu.com,🍂 Domestic
DOMAIN-SUFFIX,cnbeta.com,🍂 Domestic
DOMAIN-SUFFIX,cnbetacdn.com,🍂 Domestic
DOMAIN-SUFFIX,culturedcode.com,🍂 Domestic
DOMAIN-SUFFIX,dct-cloud.com,🍂 Domestic
DOMAIN-SUFFIX,didialift.com,🍂 Domestic
DOMAIN-SUFFIX,douban.com,🍂 Domestic
DOMAIN-SUFFIX,doubanio.com,🍂 Domestic
DOMAIN-SUFFIX,douyu.com,🍂 Domestic
DOMAIN-SUFFIX,douyu.tv,🍂 Domestic
DOMAIN-SUFFIX,douyutv.com,🍂 Domestic
DOMAIN-SUFFIX,duokan.com,🍂 Domestic
DOMAIN-SUFFIX,duoshuo.com,🍂 Domestic
DOMAIN-SUFFIX,dytt8.net,🍂 Domestic
DOMAIN-SUFFIX,easou.com,🍂 Domestic
DOMAIN-SUFFIX,ecitic.com,🍂 Domestic
DOMAIN-SUFFIX,ecitic.net,🍂 Domestic
DOMAIN-SUFFIX,eclipse.org,🍂 Domestic
DOMAIN-SUFFIX,eudic.net,🍂 Domestic
DOMAIN-SUFFIX,ewqcxz.com,🍂 Domestic
DOMAIN-SUFFIX,feng.com,🍂 Domestic
DOMAIN-SUFFIX,fir.im,🍂 Domestic
DOMAIN-SUFFIX,frdic.com,🍂 Domestic
DOMAIN-SUFFIX,fresh-ideas.cc,🍂 Domestic
DOMAIN-SUFFIX,geetest.com,🍂 Domestic
DOMAIN-SUFFIX,godic.net,🍂 Domestic
DOMAIN-SUFFIX,goodread.com,🍂 Domestic
DOMAIN-SUFFIX,google.cn,🍂 Domestic
DOMAIN-SUFFIX,gtimg.com,🍂 Domestic
DOMAIN-SUFFIX,haibian.com,🍂 Domestic
DOMAIN-SUFFIX,hao123.com,🍂 Domestic
DOMAIN-SUFFIX,haosou.com,🍂 Domestic
DOMAIN-SUFFIX,hdslb.com,🍂 Domestic
DOMAIN-SUFFIX,hdslb.net,🍂 Domestic
DOMAIN-SUFFIX,hollisterco.com,🍂 Domestic
DOMAIN-SUFFIX,hongxiu.com,🍂 Domestic
DOMAIN-SUFFIX,hxcdn.net,🍂 Domestic
DOMAIN-SUFFIX,iciba.com,🍂 Domestic
DOMAIN-SUFFIX,ifeng.com,🍂 Domestic
DOMAIN-SUFFIX,ifengimg.com,🍂 Domestic
DOMAIN-SUFFIX,images.unsplash.com,🍂 Domestic
DOMAIN-SUFFIX,images-amazon.com,🍂 Domestic
DOMAIN-SUFFIX,img4me.com,🍂 Domestic
DOMAIN-SUFFIX,ipify.org,🍂 Domestic
DOMAIN-SUFFIX,ipip.net,🍂 Domestic
DOMAIN-SUFFIX,iqiyi.com,🍂 Domestic
DOMAIN-SUFFIX,ithome.com,🍂 Domestic
DOMAIN-SUFFIX,ixdzs.com,🍂 Domestic
DOMAIN-SUFFIX,jd.com,🍂 Domestic
DOMAIN-SUFFIX,jd.hk,🍂 Domestic
DOMAIN-SUFFIX,jianshu.com,🍂 Domestic
DOMAIN-SUFFIX,jianshu.io,🍂 Domestic
DOMAIN-SUFFIX,jianshuapi.com,🍂 Domestic
DOMAIN-SUFFIX,jiathis.com,🍂 Domestic
DOMAIN-SUFFIX,jomodns.com,🍂 Domestic
DOMAIN-SUFFIX,jsboxbbs.com,🍂 Domestic
DOMAIN-SUFFIX,knewone.com,🍂 Domestic
DOMAIN-SUFFIX,kuaidi100.com,🍂 Domestic
DOMAIN-SUFFIX,lecloud.com,🍂 Domestic
DOMAIN-SUFFIX,lemicp.com,🍂 Domestic
DOMAIN-SUFFIX,letv.com,🍂 Domestic
DOMAIN-SUFFIX,letvcloud.com,🍂 Domestic
DOMAIN-SUFFIX,live.com,🍂 Domestic
DOMAIN-SUFFIX,lizhi.io,🍂 Domestic
DOMAIN-SUFFIX,localizecdn.com,🍂 Domestic
DOMAIN-SUFFIX,lucifr.com,🍂 Domestic
DOMAIN-SUFFIX,luoo.net,🍂 Domestic
DOMAIN-SUFFIX,lxdns.com,🍂 Domestic
DOMAIN-SUFFIX,mai.tn,🍂 Domestic
DOMAIN-SUFFIX,maven.org,🍂 Domestic
DOMAIN-SUFFIX,meizu.com,🍂 Domestic
DOMAIN-SUFFIX,mi.com,🍂 Domestic
DOMAIN-SUFFIX,miaopai.com,🍂 Domestic
DOMAIN-SUFFIX,miui.com,🍂 Domestic
DOMAIN-SUFFIX,miwifi.com,🍂 Domestic
DOMAIN-SUFFIX,mob.com,🍂 Domestic
DOMAIN-SUFFIX,moji.com,🍂 Domestic
DOMAIN-SUFFIX,moke.com,🍂 Domestic
DOMAIN-SUFFIX,mtalk.google.com,🍂 Domestic
DOMAIN-SUFFIX,mxhichina.com,🍂 Domestic
DOMAIN-SUFFIX,myqcloud.com,🍂 Domestic
DOMAIN-SUFFIX,myunlu.com,🍂 Domestic
DOMAIN-SUFFIX,netease.com,🍂 Domestic
DOMAIN-SUFFIX,nfoservers.com,🍂 Domestic
DOMAIN-SUFFIX,nssurge.com,🍂 Domestic
DOMAIN-SUFFIX,nuomi.com,🍂 Domestic
DOMAIN-SUFFIX,ourdvs.com,🍂 Domestic
DOMAIN-SUFFIX,overcast.fm,🍂 Domestic
DOMAIN-SUFFIX,paypal.com,🍂 Domestic
DOMAIN-SUFFIX,paypalobjects.com,🍂 Domestic
DOMAIN-SUFFIX,pgyer.com,🍂 Domestic
DOMAIN-SUFFIX,pstatp.com,🍂 Domestic
DOMAIN-SUFFIX,qbox.me,🍂 Domestic
DOMAIN-SUFFIX,qcloud.com,🍂 Domestic
DOMAIN-SUFFIX,qdaily.com,🍂 Domestic
DOMAIN-SUFFIX,qdmm.com,🍂 Domestic
DOMAIN-SUFFIX,qhimg.com,🍂 Domestic
DOMAIN-SUFFIX,qidian.com,🍂 Domestic
DOMAIN-SUFFIX,qihucdn.com,🍂 Domestic
DOMAIN-SUFFIX,qin.io,🍂 Domestic
DOMAIN-SUFFIX,qingmang.me,🍂 Domestic
DOMAIN-SUFFIX,qingmang.mobi,🍂 Domestic
DOMAIN-SUFFIX,qiniucdn.com,🍂 Domestic
DOMAIN-SUFFIX,qiniudn.com,🍂 Domestic
DOMAIN-SUFFIX,qiyi.com,🍂 Domestic
DOMAIN-SUFFIX,qiyipic.com,🍂 Domestic
DOMAIN-SUFFIX,qq.com,🍂 Domestic
DOMAIN-SUFFIX,qqurl.com,🍂 Domestic
DOMAIN-SUFFIX,rarbg.to,🍂 Domestic
DOMAIN-SUFFIX,rrmj.tv,🍂 Domestic
DOMAIN-SUFFIX,ruguoapp.com,🍂 Domestic
DOMAIN-SUFFIX,sandai.net,🍂 Domestic
DOMAIN-SUFFIX,sf-express.com,🍂 Domestic
DOMAIN-SUFFIX,sinaapp.com,🍂 Domestic
DOMAIN-SUFFIX,sinaimg.cn,🍂 Domestic
DOMAIN-SUFFIX,sinaimg.com,🍂 Domestic
DOMAIN-SUFFIX,sm.ms,🍂 Domestic
DOMAIN-SUFFIX,smzdm.com,🍂 Domestic
DOMAIN-SUFFIX,snssdk.com,🍂 Domestic
DOMAIN-SUFFIX,snwx.com,🍂 Domestic
DOMAIN-SUFFIX,so.com,🍂 Domestic
DOMAIN-SUFFIX,sogou.com,🍂 Domestic
DOMAIN-SUFFIX,sogoucdn.com,🍂 Domestic
DOMAIN-SUFFIX,sohu.com,🍂 Domestic
DOMAIN-SUFFIX,soku.com,🍂 Domestic
DOMAIN-SUFFIX,soso.com,🍂 Domestic
DOMAIN-SUFFIX,speedtest.net,🍂 Domestic
DOMAIN-SUFFIX,sspai.com,🍂 Domestic
DOMAIN-SUFFIX,startssl.com,🍂 Domestic
DOMAIN-SUFFIX,store.steampowered.com,🍂 Domestic
DOMAIN-SUFFIX,suning.com,🍂 Domestic
DOMAIN-SUFFIX,symcd.com,🍂 Domestic
DOMAIN-SUFFIX,taobao.com,🍂 Domestic
DOMAIN-SUFFIX,teamviewer.com,🍂 Domestic
DOMAIN-SUFFIX,tenpay.com,🍂 Domestic
DOMAIN-SUFFIX,tietuku.com,🍂 Domestic
DOMAIN-SUFFIX,tmall.com,🍂 Domestic
DOMAIN-SUFFIX,tmzvps.com,🍂 Domestic
DOMAIN-SUFFIX,trello.com,🍂 Domestic
DOMAIN-SUFFIX,trellocdn.com,🍂 Domestic
DOMAIN-SUFFIX,ttmeiju.com,🍂 Domestic
DOMAIN-SUFFIX,tudou.com,🍂 Domestic
DOMAIN-SUFFIX,udache.com,🍂 Domestic
DOMAIN-SUFFIX,umengcloud.com,🍂 Domestic
DOMAIN-SUFFIX,upaiyun.com,🍂 Domestic
DOMAIN-SUFFIX,upyun.com,🍂 Domestic
DOMAIN-SUFFIX,uxengine.net,🍂 Domestic
DOMAIN-SUFFIX,v2ex.co,🍂 Domestic
DOMAIN-SUFFIX,v2ex.com,🍂 Domestic
DOMAIN-SUFFIX,wandoujia.com,🍂 Domestic
DOMAIN-SUFFIX,weather.bjango.com,🍂 Domestic
DOMAIN-SUFFIX,weather.com,🍂 Domestic
DOMAIN-SUFFIX,webqxs.com,🍂 Domestic
DOMAIN-SUFFIX,weibo.cn,🍂 Domestic
DOMAIN-SUFFIX,weibo.com,🍂 Domestic
DOMAIN-SUFFIX,weico.cc,🍂 Domestic
DOMAIN-SUFFIX,weiphone.com,🍂 Domestic
DOMAIN-SUFFIX,weiphone.net,🍂 Domestic
DOMAIN-SUFFIX,wenku8.net,🍂 Domestic
DOMAIN-SUFFIX,werewolf.53site.com,🍂 Domestic
DOMAIN-SUFFIX,windowsupdate.com,🍂 Domestic
DOMAIN-SUFFIX,wkcdn.com,🍂 Domestic
DOMAIN-SUFFIX,workflowy.com,🍂 Domestic
DOMAIN-SUFFIX,xdrig.com,🍂 Domestic
DOMAIN-SUFFIX,xiami.com,🍂 Domestic
DOMAIN-SUFFIX,xiami.net,🍂 Domestic
DOMAIN-SUFFIX,xiaojukeji.com,🍂 Domestic
DOMAIN-SUFFIX,xiaomi.com,🍂 Domestic
DOMAIN-SUFFIX,xiaomi.net,🍂 Domestic
DOMAIN-SUFFIX,xiaomicp.com,🍂 Domestic
DOMAIN-SUFFIX,ximalaya.com,🍂 Domestic
DOMAIN-SUFFIX,xitek.com,🍂 Domestic
DOMAIN-SUFFIX,xmcdn.com,🍂 Domestic
DOMAIN-SUFFIX,xslb.net,🍂 Domestic
DOMAIN-SUFFIX,xteko.com,🍂 Domestic
DOMAIN-SUFFIX,xunlei.com,🍂 Domestic
DOMAIN-SUFFIX,yach.me,🍂 Domestic
DOMAIN-SUFFIX,yeepay.com,🍂 Domestic
DOMAIN-SUFFIX,yhd.com,🍂 Domestic
DOMAIN-SUFFIX,yinxiang.com,🍂 Domestic
DOMAIN-SUFFIX,yixia.com,🍂 Domestic
DOMAIN-SUFFIX,ykimg.com,🍂 Domestic
DOMAIN-SUFFIX,youdao.com,🍂 Domestic
DOMAIN-SUFFIX,youku.com,🍂 Domestic
DOMAIN-SUFFIX,yunjiasu-cdn.net,🍂 Domestic
DOMAIN-SUFFIX,zealer.com,🍂 Domestic
DOMAIN-SUFFIX,zgslb.net,🍂 Domestic
DOMAIN-SUFFIX,zhihu.com,🍂 Domestic
DOMAIN-SUFFIX,zhimg.com,🍂 Domestic
DOMAIN-SUFFIX,zimuzu.tv,🍂 Domestic
DOMAIN-SUFFIX,zmz002.com,🍂 Domestic

// Accelerate direct sites
DOMAIN-KEYWORD,torrent,🍂 Domestic
URL-REGEX,(Subject|HELO|SMTP),🍂 Domestic
URL-REGEX,(api|ps|sv|offnavi|newvector|ulog\.imap|newloc)(\.map|)\.(baidu|n\.shifen)\.com,🍂 Domestic
URL-REGEX,(.+\.|^)(360|so|qihoo|360safe|qhimg|360totalsecurity|yunpan)\.(cn|com),🍂 Domestic
URL-REGEX,(ed2k|torrent|\.torrent|peer_id=|announce|info_hash|get_peers|find_node|BitTorrent|announce_peer|protocol|announce\.php\?passkey=|magnet:|xunlei|sandai|Thunder|XLLiveUD|bt_key),🍂 Domestic
URL-REGEX,/^.*@(guerrillamail\.(info|biz|com|de|net|org)|guerrillamailblock\.com|sharklasers\.com|grr\.la|pokemail\.net|spam4\.me|(mail\.)?bccto\.me|chacuo\.net|027168\.com)$/i,🍂 Domestic

// LAN,debugging rules should place above this line
DOMAIN-SUFFIX,local,DIRECT
IP-CIDR,10.0.0.0/8,DIRECT
IP-CIDR,100.64.0.0/10,DIRECT
IP-CIDR,127.0.0.0/8,DIRECT
IP-CIDR,172.16.0.0/12,DIRECT
IP-CIDR,192.168.0.0/16,DIRECT
{/if}

GEOIP,CN,🍂 Domestic
FINAL,☁️ Others,dns-failed

[Host]
localhost = 127.0.0.1
syria.sy = 127.0.0.1
*.1688.com = server:223.6.6.6
*.fliggy.com = server:223.6.6.6
*.aliqin.com = server:223.6.6.6
*.tmall.com = server:223.6.6.6
*.taobao.com = server:223.6.6.6
*.ali*.com = server:223.6.6.6
*.upyun.com = server:223.6.6.6
*.mmstat.com = server:223.6.6.6
*.jd.com = server:119.29.29.29
*.qq.com = server:119.29.29.29
*buyimg.com = server:119.29.29.29
*gtimg.* = server:119.29.29.29
{literal}
[URL Rewrite]
// Google_Service_HTTPS_Jump
^https?:\/\/(www\.)?g\.cn https://www.google.com 302
^https?:\/\/(www\.)?google\.cn https://www.google.com 302

// Anti_ISP_JD_Hijack
^https?:\/\/coupon\.m\.jd\.com\/ https://coupon.m.jd.com/ 302
^https?:\/\/h5\.m\.jd\.com\/ https://h5.m.jd.com/ 302
^https?:\/\/item\.m\.jd\.com\/ https://item.m.jd.com/ 302
^https?:\/\/m\.jd\.com\/ https://m.jd.com/ 302
^https?:\/\/newcz\.m\.jd\.com\/ https://newcz.m.jd.com/ 302
^https?:\/\/p\.m\.jd\.com\/ https://p.m.jd.com/ 302
^https?:\/\/so\.m\.jd\.com\/ https://so.m.jd.com/ 302
^https?:\/\/union\.click\.jd\.com\/jda? http://union.click.jd.com/jda?adblock= header
^https?:\/\/union\.click\.jd\.com\/sem.php? http://union.click.jd.com/sem.php?adblock= header
^https?:\/\/www.jd.com\/ https://www.jd.com/ 302

// Anti_ISP_Taobao_Hijack
^https?:\/\/m\.taobao\.com\/ https://m.taobao.com/ 302

// Wiki
^https?:\/\/.+.(m\.)?wikipedia\.org/wiki http://www.wikiwand.com/en 302
^https?:\/\/zh.(m\.)?wikipedia\.org/(zh-hans|zh-sg|zh-cn|zh(?=/)) http://www.wikiwand.com/zh 302
^https?:\/\/zh.(m\.)?wikipedia\.org/zh-[a-zA-Z]{2,} http://www.wikiwand.com/zh-hant 302

// Other
^https?:\/\/cfg\.m\.ttkvod\.com\/mobile\/ttk_mobile_1.8\.txt http://ogtre5vp0.bkt.clouddn.com/Static/TXT/ttk_mobile_1.8.txt header
^https?:\/\/cnzz\.com\/ http://ogtre5vp0.bkt.clouddn.com/background.png? header
^https?:\/\/m\.qu\.la\/stylewap\/js\/wap\.js http://ogtre5vp0.bkt.clouddn.com/qu_la_wap.js 302
^https?:\/\/m\.yhd\.com\/1\/\? http://m.yhd.com/1/?adbock= 302
^https?:\/\/n\.mark\.letv\.com\/m3u8api\/ http://burpsuite.applinzi.com/Interface header
^https?:\/\/sqimg\.qq\.com\/ https://sqimg.qq.com/ 302
^https?:\/\/static\.m\.ttkvod\.com\/static_cahce\/index\/index\.txt http://ogtre5vp0.bkt.clouddn.com/Static/TXT/index.txt header
^https?:\/\/www\.iqshw\.com\/d\/js\/m http://burpsuite.applinzi.com/Interface header
^https?:\/\/www\.iqshw\.com\/d\/js\/m http://rewrite.websocket.site:10/Other/Static/JS/Package.js? header

// Tiktok US
(?<=aweme\/v1\/)playwm play 302
(?<=&ac=)4G(?=.*) WIFI 302
(?<=_region=)CN(?=&) US 302
(?<=&app_version=)9..(?=.?.?&) 1 302
(?<=\?version_code=)9..(?=.?.?&) 1 302
(?<=&?watermark=)1(?=.*) 0 302
{/literal}
[Header Rewrite]
^*.bdimg.com header-del Referer
^*.qpic.cn header-replace User-Agent WeChat/6.5.22.32 CFNetwork/889.9 Darwin/17.2.0
^*.qpic.cn header-del Referer
^*.ph.126.net header-del Referer
^*.zhimg.com header-del Referer
^*.cnbetacdn.com header-del Referer
^*.zhiding.cn header-del Referer
^*.c114.com.cn header-del Referer
^https?://www.biquge.com.tw header-del Cookie
^https?://www.zhihu.com/question/ header-replace User-Agent Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.45 Safari/537.36
