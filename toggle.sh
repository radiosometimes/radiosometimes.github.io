url="http:\/\/45.55.199.85:8000\/sometimes.ogg"
if [ $2 ]; then
	url=${2//\//\\/}
	echo $url
fi

if [ $1 == "on" ]; then
	sed -i '12s/$<!--<div/<div/' index.html
	sed -i '17s/\/div>-->^/\/div>/' index.html
	sed -i '11s/$<h1/<!--<h1/' index.html
	sed -i '11s/\/h1>^/\/h1>-->/' index.html
	sed -i "15s/src=\"[a-z0-9.:\/]*\"/src=\"$url\"/" index.html 
else
	if [ $1 == "off" ]; then
		sed -i '11s/$<!--<h1/<h1/' index.html
		sed -i '11s/\/h1>-->^/h1>/' index.html
		sed -i '12s/$<div/<!--<div/' index.html
		sed -i '17s/\/div>^/\/div>-->/' index.html
	fi
fi

git commit -am "toggle that radio"
git push origin master
