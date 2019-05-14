CubesViewer - APS
========================

1. Install Cubes package via PIP:

   `pip install -r requirements.txt`

   > 缺少mysql以来的话`python3 -m pip install pymysql`

   This will install dependencies: Cubes, Flask and SQLAlchemy.

2. Run Cubes OLAP server (the tool is called `slicer`):

   ```js
   slicer serve slicer.ini
   ```
   

   
3. Visit `http://localhost:5000` and check the server response. Cubes should reply
   with a short web page describing its configuration.
   
4. Initializing the database

   ```js
   cd cvapp/
   python manage.py migrate
   python manage.py createsuperuser #输入超级用户密码
   ```

   [Backend for CubesViewer   version: 65b1654](https://github.com/jjmontesl/cubesviewer-server/blob/65b1654c64148ea6f75fe59acef480f28b0021e7/README.md)

5. Running with Django WebServer

   ```js
   python manage.py runserver 0.0.0.0:8088
   ```

6. Now, the application should be available from your browser using `http://localhost:8000/`.

   







