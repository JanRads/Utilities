USE [dbmSemanticAnalytics]
GO

delete [Factless].[PatientRelationsFromTo] where [id_Patient]>1000

INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score]) VALUES (1001, 11, 2, 20100101, 20201231, 30, 1)
GO
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score]) VALUES (1002, 11, 2, 20100101, 20201231, 36, 2)
GO
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score]) VALUES (1004, 11, 6, 20100101, 20201231, 22, 3)
GO
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score]) VALUES (1005, 11, 6, 20100101, 20201231, 20, 1)
GO
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score]) VALUES (1006, 11, 7, 20100101, 20201231, 25, 4)
GO


