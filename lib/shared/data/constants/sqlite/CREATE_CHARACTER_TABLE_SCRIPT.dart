const String CREATE_CHARACTER_TABLE_SCRIPT = """
CREATE TABLE character (
  id INTEGER PRIMARY KEY,
  name TEXT,
  race TEXT,
  url TEXT,
  strength INTEGER,
  description TEXT
);
""";
