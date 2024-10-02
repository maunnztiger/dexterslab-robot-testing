import json

def verify_json_data(table_json_path, file_json_path):
    # Lade das JSON-Array der Tabellendaten (aus dem Robot Framework generiert)
    with open(table_json_path, encoding='utf-8') as table_file:
        table_data = json.load(table_file)

    # Lade das JSON-Array aus der Datei mit den erwarteten Werten
    with open(file_json_path, encoding='utf-8') as file_data_file:
        expected_data = json.load(file_data_file)

    # Überprüfe, ob die beiden JSON-Daten gleich sind
    if table_data == expected_data:
        print("Die JSON-Strukturen sind identisch.")
    else:
        print("Die JSON-Strukturen sind unterschiedlich.")
        # Optional: Finde die Unterschiede zwischen beiden JSON-Daten
        compare_json_data(table_data, expected_data)


def compare_json_data(table_data, expected_data):
    # Vergleiche die Länge der beiden JSON-Arrays
    if len(table_data) != len(expected_data):
        print(f"Die JSON-Daten haben unterschiedliche Längen: {len(table_data)} vs {len(expected_data)}")
    
    # Vergleiche die Inhalte der einzelnen Einträge
    for index, (table_entry, expected_entry) in enumerate(zip(table_data, expected_data)):
        if table_entry != expected_entry:
            print(f"Unterschied in Eintrag {index}:")
            print(f"Tabellendaten: {table_entry}")
            print(f"Erwartete Daten: {expected_entry}")


def convert_to_json_string(data):
    return json.dumps(data, ensure_ascii=False, indent=4)
   