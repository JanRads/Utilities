USE [dbmSemanticAnalytics]
GO

DELETE Fact.Summary_Population where id_patient > 1000

INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1001, 20100101, 21000101, 11, 1)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1001, 20100101, 21000101, 12, 16)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1001, 20100101, 21000101, 13, 25)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1001, 20100101, 21000101, 14, 35)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1002, 20100101, 21000101, 11, 1)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1002, 20100101, 21000101, 12, 16)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1002, 20100101, 21000101, 13, 25)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1002, 20100101, 21000101, 14, 35)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1004, 20100101, 21000101, 11, 1)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1004, 20100101, 21000101, 12, 16)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1004, 20100101, 21000101, 13, 25)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1006, 20100101, 21000101, 11, 1)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1006, 20100101, 21000101, 12, 16)
GO
INSERT [Fact].[Summary_Population] ([id_patient], [Date_Start], [Date_End], [attrib_MeasureLevel2Key], [attrib_BuildingBlocks]) VALUES (1006, 20100101, 21000101, 14, 35)
GO
