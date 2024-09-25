import json
import codecs

def load_json_utf8(file_path):
    with codecs.open(file_path, 'r', 'utf-8') as f:
        return json.load(f)
       