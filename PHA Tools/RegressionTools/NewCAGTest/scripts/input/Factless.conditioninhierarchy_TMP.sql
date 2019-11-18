/*inserting temporary data into AdminCodes for MSSP Tests*/

IF NOT EXISTS(SELECT top(1) 1 FROM [dbmSemanticAnalytics].[Factless].[ConditionsInHierarchy]  where FK in (700000,700001,700002,700003,700004,700005,700006,700007,700008,700009,700010,700011,700012,700013,700014,700015,700016,700017,700018,700019,700020))
BEGIN
--SET IDENTITY_INSERT  [dbmSemanticAnalytics].[Factless].[ConditionsInHierarchy] ON

  insert into [dbmSemanticAnalytics].[Factless].[ConditionsInHierarchy] 
  ( [FK]
      ,[NodeFK]
      ,[FlagNew]
      ,[DimName])
 values (700000,700000,1,'claims'),
 (700001,700001,1,'Procedures'),
 (700002,700002,1,'Procedures'),
 (700003,700003,1,'Procedures'),
 (700004,700004,1,'Procedures'),
 (700005,700005,1,'claims'),
 (700006,700006,1,'claims'),
 (700007,700007,1,'claims'),
 (700008,700008,1,'claims'),
 (700009,700009,1,'claims'),
 (700010,700010,1,'claims'),
 (700011,700011,1,'claims'),
 (700012,700012,1,'claims'),
 (700013,700013,1,'claims'),
 (700014,700014,1,'claims'),
 (700015,700015,1,'Procedures'),
 (700016,700016,1,'Procedures'),
 (700017,700017,1,'Procedures'),
 (700018,700018,1,'Procedures'),
 (700019,700019,1,'Procedures'),
 (700020,700020,1,'Procedures')

--SET IDENTITY_INSERT  [dbmSemanticAnalytics].[Dim].[AdminCodes] OFF
END

