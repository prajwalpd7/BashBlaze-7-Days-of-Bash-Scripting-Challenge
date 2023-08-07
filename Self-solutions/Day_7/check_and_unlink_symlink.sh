if [ -h /etc/nginx/sites-enabled/my_app ]; then
    echo "A symbolic link with the name 'my_app' already exists in /etc/nginx/sites-enabled/."
    
    echo "Removing it before creating a new symlink."
    echo "admin1234" | sudo -S unlink /etc/nginx/sites-enabled/my_app
     echo "admin1234" | sudo -S ln -s /etc/nginx/sites-available/my_app /etc/nginx/sites-enabled/
    echo "Symlink 'my_app' created in /etc/nginx/sites-enabled/."
else
    echo "admin1234" | sudo -S ln -s /etc/nginx/sites-available/my_app /etc/nginx/sites-enabled/
    echo "Symlink 'my_app' created in /etc/nginx/sites-enabled/."
fi
