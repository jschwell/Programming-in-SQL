USE MyGuitarShop;

DECLARE @DynamicSQL varchar(256),
        @LoginName varchar(128),
		@FirstName varchar(255),
		@LastName varchar(255);

DECLARE Login_Cursor CURSOR
DYNAMIC
FOR
  SELECT FirstName, LastName
  FROM Administrators;

OPEN Login_Cursor;
FETCH NEXT FROM Login_Cursor
  INTO @FirstName, @LastName;
WHILE @@FETCH_STATUS = 0
  BEGIN
	SET @LoginName = @FirstName + @LastName;
    SET @DynamicSQL = 'CREATE LOGIN ' + @LoginName + ' ' +
                      'WITH PASSWORD = ''' + 'temp' + ''', ' +
                      'DEFAULT_DATABASE = MyGuitarShop';
    EXEC (@DynamicSQL);
    SET @DynamicSQL = 'CREATE USER ' + @LoginName + ' ' +
                      'FOR LOGIN ' + @LoginName;
    EXEC (@DynamicSQL);
    SET @DynamicSQL = 'ALTER ROLE OrderEntry ADD MEMBER ' +
                      @LoginName;
    EXEC (@DynamicSQL);
    FETCH NEXT FROM Login_Cursor
      INTO @FirstName, @LastName;
  END;
CLOSE Login_Cursor;

DEALLOCATE Login_Cursor;
