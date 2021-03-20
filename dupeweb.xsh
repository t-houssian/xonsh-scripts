# xonsh dupeweb.xsh "url"
# xonsh dupeweb.xsh "https://www.google.com/"

print($ARGS[1])

from pywebcopy import save_webpage
import tldextract

url = $ARGS[1]

$(cd project)
$(git clone https://github.com/t-houssian-school/thoussian.github.io.git)
$(cd thoussian.github.io)

import os
dir = os.getcwd()

download_folder = dir + "/" 


ext = tldextract.extract($ARGS[1])
print(f"Creating {ext.domain} project")

kwargs = {'bypass_robots': True, 'project_name': ext.domain}

save_webpage(url, download_folder, **kwargs)

print(download_folder)

$(git add *)
$(git commit -m "New Site Added")
$(git push origin main)

print("Done")

if ext.subdomain:
    print("Here is your duplicated website: \n" + f"https://t-houssian-school.github.io/thoussian.github.io/{ext.domain}/{ext.subdomain}.{ext.domain}.{ext.suffix}/index.html") 
else:
    print("Here is your duplicated website: \n" + f"https://t-houssian-school.github.io/thoussian.github.io/{ext.domain}/{ext.domain}.{ext.suffix}/index.html")
