#/bin/sh

for entry in *
do
	if [ $entry == install.sh ]
	then 
		continue
	else
		echo "Installing $entry config..."
		sudo cp -r $entry ~/.config
		echo "Done installing $entry config!"
	fi
done
