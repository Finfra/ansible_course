cat <<EOF>  template.html
<html>
<head><title>{{ title }}</title></head>
<body>
{{ body }}
</body>
</html>
EOF

echo --------------------------------------------------------------------------------
echo cat template.html
echo --------------------------------------------------------------------------------
cat template.html
echo --------------------------------------------------------------------------------


cat <<EOF> jinjaTest.py
from jinja2 import Environment, FileSystemLoader
import os
THIS_DIR = os.path.dirname(os.path.abspath(__file__))
j2_env = Environment(loader=FileSystemLoader(THIS_DIR),trim_blocks=True)
print(j2_env.get_template('template.html').render(title='Hellow Gist from GutHub',body="hi"))
EOF


echo --------------------------------------------------------------------------------
echo cat jinjaTest.py
echo --------------------------------------------------------------------------------
cat jinjaTest.py
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo python jinjaTest.py
echo --------------------------------------------------------------------------------
python jinjaTest.py
echo --------------------------------------------------------------------------------
