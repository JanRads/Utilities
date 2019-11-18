USE [dbmSemanticAnalyticsSTG]
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1111, N'HbA1c Monitoring', N'Not Performed', N'OHAD', NULL, 1, 11, 111, NULL, CAST(15.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Monitoring', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1112, N'LDL-C Monitoring', N'Not Performed', N'OHAD', NULL, 1, 11, 111, NULL, CAST(15.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Monitoring', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1113, N'Microalbumin Monitoring', N'Not Performed', N'OHAD', NULL, 1, 11, 111, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Monitoring', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1121, N'HbA1c Management: Adequate Control (≤8%)', N'HbA1c ≤8% (Normal)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(25.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'HbA1c ≤8% (Normal)', N'HbA1c ≤8% (Normal)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1122, N'HbA1c Management: Poor Control (>9%)', N'HbA1c >9% (High)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(30.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'HbA1c >9% (High)', N'HbA1c >9% (High)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1123, N'Lipid Management: LDL-C ≤100', N'LDL-C ≤100 (Normal)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(25.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'LDL-C ≤100 (Normal)', N'LDL-C ≤100 (Normal)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1124, N'HbA1c Management: Intermediate Control (8%< HbA1c ≤9%)', N'8%< HbA1c ≤9% (Elevated)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(1.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'8%< HbA1c ≤9% (Elevated)', N'8%< HbA1c ≤9% (Elevated)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1125, N'Lipid Management: 100< LDL-C ≤130', N'100< LDL-C ≤130 (Elevated)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(1.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'100< LDL-C ≤130 (Elevated)', N'100< LDL-C ≤130 (Elevated)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1126, N'Lipid Management: LDL-C >130', N'LDL-C >130 (High)', N'OHAD', NULL, 1, 11, 112, NULL, CAST(30.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Control', N'LDL-C >130 (High)', N'LDL-C >130 (High)', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1131, N'Pneumococcal Vaccination', N'Not Performed', N'OHAD', NULL, 1, 11, 113, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1132, N'Influenza Immunization', N'Not Performed', N'OHAD', NULL, 1, 11, 113, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Diabetes', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1231, N'LDL-C Monitoring', N'Not Performed', N'OHAD', NULL, 1, 12, 123, NULL, CAST(1.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Monitoring', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1211, N'Lipid Management: LDL-C ≤100', N'LDL-C ≤100 (Normal)', N'OHAD', NULL, 1, 12, 121, NULL, CAST(5.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Control', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1212, N'Lipid Management: 100< LDL-C ≤130', N'100< LDL-C ≤130 (Elevated)', N'OHAD', NULL, 1, 12, 121, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Control', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1213, N'Lipid Management: LDL-C >130', N'LDL-C >130 (High)', N'OHAD', NULL, 1, 12, 121, NULL, CAST(15.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Control', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1221, N'Beta Blocker Pharmacotherapy - Prior MI', N'Not Received', N'OHAD', NULL, 1, 12, 122, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1222, N'Antiplatelet Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 12, 122, NULL, CAST(1.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Coronary Artery Disease', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1311, N'Beta Blocker Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 13, 131, NULL, CAST(5.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1312, N'ACE Inhibitor or ARB Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 13, 131, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1313, N'Antiplatelet Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 13, 131, NULL, CAST(15.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1314, N'Anticoagulant Pharmacotherapy for Atrial Fibrillation', N'Not Received', N'OHAD', NULL, 1, 13, 131, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Pharmacologic Therapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1321, N'Pneumococcal Vaccination', N'Not Performed', N'OHAD', NULL, 1, 13, 132, NULL, CAST(1.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1322, N'Influenza Immunization', N'Not Performed', N'OHAD', NULL, 1, 13, 132, NULL, CAST(5.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Heart Failure', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1411, N'Long-term Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 14, 141, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Asthma', N'Pharmacologic Therapy', N' Received', N'Not Received', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1421, N'Pneumococcal Vaccination', N'Not Performed', N'OHAD', NULL, 1, 14, 142, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Asthma', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1422, N'Influenza Immunization', N'Not Performed', N'OHAD', NULL, 1, 14, 142, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Asthma', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1611, N'BMI Monitoring', N'Not Performed', N'OHAD', NULL, 1, 16, 161, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BMI Measurement', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1612, N'BMI Control: Normal BMI', N'Normal BMI', N'OHAD', NULL, 1, 16, 161, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BMI Measurement', N'Normal BMI', N'Normal BMI', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1613, N'BMI Control: High BMI', N'High BMI', N'OHAD', NULL, 1, 16, 161, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BMI Measurement', N'High BMI', N'High BMI', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1620, N'BP Monitoring', N'Not Performed', N'OHAD', NULL, 1, 16, 163, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BP Measurement', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1621, N'BP Control: Normal BP', N'Normal BP', N'OHAD', NULL, 1, 16, 163, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BP Measurement', N'Normal BP', N'Normal BP', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1622, N'BP Control: Elevated BP', N'Elevated BP', N'OHAD', NULL, 1, 16, 163, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BP Measurement', N'Elevated BP', N'Elevated BP', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1623, N'BP Control: High BP', N'High BP', N'OHAD', NULL, 1, 16, 163, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BP Measurement', N'High BP', N'High BP', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1624, N'BP Control: Very High BP', N'Very High BP', N'OHAD', NULL, 1, 16, 163, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'BP Measurement', N'Very High BP', N'Very High BP', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1615, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'OHAD', NULL, 1, 16, 162, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'Pharmacotherapy', N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1616, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'OHAD', NULL, 1, 16, 162, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1614, N'Antihypertensive Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 16, 162, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'Hypertension', N'Pharmacotherapy', N'Received', N'Not Received', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1710, N'COPD Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 17, 171, NULL, CAST(5.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Pharmacotherapy', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1711, N'Exacerbation Management: COPD ED Visits', N'COPD ED visit', N'OHAD', NULL, 1, 17, 172, NULL, CAST(10.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1712, N'Exacerbation Management: COPD Admissions', N'COPD Admission', N'OHAD', NULL, 1, 17, 172, NULL, CAST(15.00 AS Decimal(18, 2)), 2, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1713, N'Exacerbation Management: Systemic Corticosteroids', N'Systemic Corticosteroids only', N'OHAD', NULL, 1, 17, 172, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1714, N'Exacerbation Management: Bronchodilators', N'Bronchodilators only', N'OHAD', NULL, 1, 17, 172, NULL, CAST(1.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1715, N'Exacerbation Management: Combined Pharmacotherapy', N'Bronchodilators and Systemic Corticosteroids', N'OHAD', NULL, 1, 17, 172, NULL, CAST(5.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1716, N'Exacerbation Management: Pharmacotherapy', N'Not Received', N'OHAD', NULL, 1, 17, 172, NULL, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Exacerbation Management', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1717, N'Influenza Immunization', N'Not Performed', N'OHAD', NULL, 1, 17, 173, NULL, CAST(15.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
INSERT [Config].[MetricsDefinitions] ([MetricKey], [MetricName], [Description], [Author], [Source], [Level1], [Level2], [Level3], [InHierarchy], [Weight], [ImpN], [TargetScore], [IsNew], [IsDelete], [StrXML], [Level1Desc], [Level2Desc], [Level3Desc], [MeasureCompliance], [MeasureNotCompliance], [MetricUnId]) VALUES (1718, N'Pneumococcal Vaccination', N'Not Performed', N'OHAD', NULL, 1, 17, 173, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(0.77 AS Decimal(18, 2)), NULL, NULL, NULL, N'CQM', N'COPD', N'Immunization', N'Performed', N'Not Performed', NULL)
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [dbmSemanticAnalytics]

GO
INSERT [Dim].[CombPrograms] ([id_CombProg], [id_Programs]) VALUES (1, N'1')
GO
INSERT [Dim].[CombPrograms] ([id_CombProg], [id_Programs]) VALUES (2, N'1,2')
GO
INSERT [Dim].[CombPrograms] ([id_CombProg], [id_Programs]) VALUES (3, N'3')
GO
INSERT [Dim].[CombPrograms] ([id_CombProg], [id_Programs]) VALUES (4, N'2,3,4')
GO
INSERT [Dim].[CombPrograms] ([id_CombProg], [id_Programs]) VALUES (5, N'5')
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GO

--INSERT [Dim].[Programs] ([id_Program], [ProgramName]) VALUES (1, N'Clalit')
--GO
--INSERT [Dim].[Programs] ([id_Program], [ProgramName]) VALUES (2, N'Maccabi')
--GO
--INSERT [Dim].[Programs] ([id_Program], [ProgramName]) VALUES (3, N'Meuhedet')
--GO
--INSERT [Dim].[Programs] ([id_Program], [ProgramName]) VALUES (4, N'Leumi')
--GO
--INSERT [Dim].[Programs] ([id_Program], [ProgramName]) VALUES (5, N'Arael')
--GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [dbmSemanticAnalytics]
GO
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (52, 13, 22, 20140303, 20170131, 11, 1, 1)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (52, 13, 22, 20170201, 20301231, 11, 1, 4)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (1, 14, 3, 20130720, 20301231, 11, 1, 4)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (7, 14, 3, 20130708, 20301231, 11, 1, 3)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (19, 14, 3, 20130708, 20301231, 11, 1, 5)

INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (18, 13, 3, 20130720, 20301231, 11, 1, 1)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (60, 13, 3, 20130101, 20170131, 10, 1, 3)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (60, 42, 4, 20170201, 20301231, 10, 1, 3)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (17, 13, 3, 20150101, 20170119, 11, 1, 2)
INSERT [Factless].[PatientRelationsFromTo] ([id_Patient], [provider_Related], [org_RelatedProvider], [date__from_Relationship], [date_To_Relationship], [attrib_PatientAge], [Severity_Score], [comb_prog]) VALUES (17, 42, 4, 20170120, 20301231, 11, 1, 2)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [dbmSemanticAnalytics]
GO
SET IDENTITY_INSERT [Fact].[SeverityScores] ON 

GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (1, 1, 1, 2, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (2, 1, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (3, 1, 2, 14, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (4, 1, 2, 14, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (5, 1, 3, 30, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (6, 1, 3, 30, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (7, 1, 3, 30, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (8, 1, 3, 30, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (9, 1, 3, 30, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (10, 1, 3, 30, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (11, 1, 3, 30, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (12, 1, 3, 30, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (13, 1, 3, 30, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (14, 1, 3, 30, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (15, 1, 3, 30, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (16, 1, 3, 30, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (17, 1, 3, 30, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (18, 1, 3, 30, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (19, 1, 3, 30, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (20, 1, 3, 30, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (21, 1, 3, 30, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (22, 1, 3, 30, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (23, 1, 3, 30, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (24, 1, 3, 30, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (25, 1, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (26, 1, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (27, 1, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (28, 1, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (29, 1, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (30, 1, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (31, 1, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (32, 1, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (33, 1, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (34, 1, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (35, 1, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (36, 1, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (37, 4, 1, 2, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (38, 4, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (39, 4, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (40, 4, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (41, 4, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (42, 4, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (43, 4, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (44, 4, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (45, 4, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (46, 4, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (47, 4, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (48, 4, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (49, 4, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (50, 4, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (51, 4, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (52, 4, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (53, 4, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (54, 4, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (55, 4, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (56, 4, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (57, 4, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (58, 4, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (59, 4, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (60, 4, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (61, 4, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (62, 4, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (63, 4, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (64, 4, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (65, 4, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (66, 4, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (67, 4, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (68, 4, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (69, 4, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (70, 4, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (71, 4, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (72, 4, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (73, 6, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (74, 6, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (75, 6, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (76, 6, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (77, 6, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (78, 6, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (79, 6, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (80, 6, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (81, 6, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (82, 6, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (83, 6, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (84, 6, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (85, 6, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (86, 6, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (87, 6, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (88, 6, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (89, 6, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (90, 6, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (91, 6, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (92, 6, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (93, 6, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (94, 6, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (95, 6, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (96, 6, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (97, 6, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (98, 6, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (99, 6, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (100, 6, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (101, 6, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (102, 6, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (103, 6, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (104, 6, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (105, 6, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (106, 6, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (107, 6, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (108, 6, 1, 2, N'MCC Score', N'2019_11', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (109, 7, 2, 14, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (110, 7, 2, 14, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (111, 7, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (112, 7, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (113, 7, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (114, 7, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (115, 7, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (116, 7, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (117, 7, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (118, 7, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (119, 7, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (120, 7, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (121, 7, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (122, 7, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (123, 7, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (124, 7, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (125, 7, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (126, 7, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (127, 7, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (128, 7, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (129, 7, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (130, 7, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (131, 7, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (132, 7, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (133, 7, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (134, 7, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (135, 7, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (136, 7, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (137, 7, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (138, 7, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (139, 7, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (140, 7, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (141, 7, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (142, 7, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (143, 7, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (144, 7, 1, 2, N'MCC Score', N'2019_11', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (145, 8, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (146, 8, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (147, 8, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (148, 8, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (149, 8, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (150, 8, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (151, 8, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (152, 8, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (153, 8, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (154, 8, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (155, 8, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (156, 8, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (157, 8, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (158, 8, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (159, 8, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (160, 8, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (161, 8, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (162, 8, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (163, 8, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (164, 8, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (165, 8, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (166, 8, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (167, 8, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (168, 8, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (169, 8, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (170, 8, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (171, 8, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (172, 8, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (173, 8, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (174, 8, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (175, 8, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (176, 8, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (177, 8, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (178, 8, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (179, 8, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (180, 8, 1, 2, N'MCC Score', N'2019_11', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (181, 10, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (182, 10, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (183, 10, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (184, 10, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (185, 10, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (186, 10, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (187, 10, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (188, 10, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (189, 10, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (190, 10, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (191, 10, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (192, 10, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (193, 10, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (194, 10, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (195, 10, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (196, 10, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (197, 10, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (198, 10, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (199, 10, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (200, 10, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (201, 10, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (202, 10, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (203, 10, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (204, 10, 1, 2, N'MCC Score', N'2019_11', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (205, 10, 1, 2, N'MCC Score', N'2019_12', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (206, 10, 1, 2, N'MCC Score', N'2020_01', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (207, 10, 1, 2, N'MCC Score', N'2020_02', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (208, 10, 1, 2, N'MCC Score', N'2020_03', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (209, 10, 1, 2, N'MCC Score', N'2020_04', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (210, 10, 1, 2, N'MCC Score', N'2020_05', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (211, 10, 1, 2, N'MCC Score', N'2020_06', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (212, 10, 1, 2, N'MCC Score', N'2020_07', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (213, 10, 1, 2, N'MCC Score', N'2020_08', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (214, 10, 1, 2, N'MCC Score', N'2020_09', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (215, 10, 1, 2, N'MCC Score', N'2020_10', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (216, 10, 1, 2, N'MCC Score', N'2020_11', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (217, 11, 1, 128, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (218, 11, 1, 128, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (219, 11, 1, 128, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (220, 11, 1, 128, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (221, 11, 1, 128, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (222, 11, 1, 128, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (223, 11, 1, 128, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (224, 11, 1, 128, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (225, 11, 1, 128, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (226, 11, 1, 128, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (227, 11, 1, 128, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (228, 11, 1, 128, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (229, 11, 1, 128, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (230, 11, 1, 128, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (231, 11, 1, 128, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (232, 11, 1, 128, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (233, 11, 1, 128, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (234, 11, 1, 128, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (235, 11, 1, 128, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (236, 11, 1, 128, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (237, 11, 1, 128, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (238, 11, 1, 128, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (239, 11, 1, 128, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (240, 11, 1, 128, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (241, 15, 1, 2, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (242, 15, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (243, 15, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (244, 15, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (245, 15, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (246, 15, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (247, 15, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (248, 15, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (249, 15, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (250, 15, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (251, 15, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (252, 15, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (253, 15, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (254, 15, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (255, 15, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (256, 15, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (257, 15, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (258, 15, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (259, 15, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (260, 15, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (261, 15, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (262, 15, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (263, 15, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (264, 15, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (265, 15, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (266, 15, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (267, 15, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (268, 15, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (269, 15, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (270, 15, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (271, 15, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (272, 15, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (273, 15, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (274, 15, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (275, 15, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (276, 15, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (277, 17, 1, 128, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (278, 17, 1, 128, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (279, 17, 1, 128, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (280, 17, 1, 128, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (281, 17, 1, 128, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (282, 17, 1, 128, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (283, 17, 1, 128, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (284, 17, 1, 128, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (285, 17, 1, 128, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (286, 17, 1, 128, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (287, 17, 1, 128, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (288, 17, 1, 128, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (289, 17, 1, 128, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (290, 17, 1, 128, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (291, 17, 1, 128, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (292, 17, 1, 128, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (293, 17, 1, 128, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (294, 17, 1, 128, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (295, 17, 1, 128, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (296, 17, 1, 128, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (297, 17, 1, 128, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (298, 17, 1, 128, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (299, 17, 1, 128, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (300, 17, 1, 128, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (301, 18, 1, 128, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (302, 18, 1, 128, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (303, 18, 1, 128, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (304, 18, 1, 128, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (305, 18, 1, 128, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (306, 18, 1, 128, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (307, 18, 1, 128, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (308, 18, 1, 128, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (309, 18, 1, 128, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (310, 18, 1, 128, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (311, 18, 1, 128, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (312, 18, 1, 128, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (313, 18, 1, 128, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (314, 18, 1, 128, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (315, 18, 1, 128, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (316, 18, 1, 128, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (317, 18, 1, 128, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (318, 18, 1, 128, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (319, 18, 1, 128, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (320, 18, 1, 128, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (321, 18, 1, 128, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (322, 18, 1, 128, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (323, 18, 1, 128, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (324, 18, 1, 128, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (325, 20, 2, 4112, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (326, 20, 2, 4112, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (327, 20, 2, 4112, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (328, 20, 2, 4112, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (329, 20, 2, 4112, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (330, 20, 2, 4112, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (331, 20, 2, 4112, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (332, 20, 2, 4112, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (333, 20, 2, 4112, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (334, 20, 2, 4112, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (335, 20, 2, 4112, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (336, 20, 2, 4112, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (337, 21, 1, 65536, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (338, 21, 1, 65536, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (339, 21, 1, 65536, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (340, 21, 1, 65536, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (341, 21, 1, 65536, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (342, 21, 1, 65536, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (343, 21, 1, 65536, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (344, 21, 1, 65536, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (345, 21, 1, 65536, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (346, 21, 1, 65536, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (347, 21, 1, 65536, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (348, 21, 1, 65536, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (349, 21, 1, 65536, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (350, 21, 1, 65536, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (351, 21, 1, 65536, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (352, 21, 1, 65536, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (353, 21, 1, 65536, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (354, 21, 1, 65536, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (355, 21, 1, 65536, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (356, 21, 1, 65536, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (357, 21, 1, 65536, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (358, 21, 1, 65536, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (359, 21, 1, 65536, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (360, 21, 1, 65536, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (361, 26, 1, 16, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (362, 26, 1, 16, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (363, 26, 1, 16, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (364, 26, 1, 16, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (365, 26, 1, 16, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (366, 26, 1, 16, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (367, 26, 1, 16, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (368, 26, 1, 16, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (369, 26, 1, 16, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (370, 26, 1, 16, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (371, 26, 1, 16, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (372, 26, 1, 16, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (373, 28, 1, 4, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (374, 28, 1, 4, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (375, 28, 1, 4, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (376, 28, 1, 4, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (377, 28, 1, 4, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (378, 28, 1, 4, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (379, 28, 1, 4, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (380, 28, 1, 4, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (381, 28, 1, 4, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (382, 28, 1, 4, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (383, 28, 1, 4, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (384, 28, 1, 4, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (385, 28, 1, 4, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (386, 28, 1, 4, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (387, 28, 1, 4, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (388, 28, 1, 4, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (389, 28, 1, 4, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (390, 28, 1, 4, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (391, 28, 1, 4, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (392, 28, 1, 4, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (393, 28, 1, 4, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (394, 28, 1, 4, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (395, 28, 1, 4, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (396, 28, 1, 4, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (397, 29, 1, 4, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (398, 29, 1, 4, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (399, 29, 1, 4, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (400, 29, 1, 4, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (401, 29, 1, 4, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (402, 29, 1, 4, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (403, 29, 1, 4, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (404, 29, 1, 4, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (405, 29, 1, 4, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (406, 29, 1, 4, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (407, 29, 1, 4, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (408, 29, 1, 4, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (409, 29, 1, 4, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (410, 29, 1, 4, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (411, 29, 1, 4, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (412, 29, 1, 4, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (413, 29, 1, 4, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (414, 29, 1, 4, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (415, 29, 1, 4, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (416, 29, 1, 4, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (417, 29, 1, 4, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (418, 29, 1, 4, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (419, 29, 1, 4, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (420, 29, 1, 4, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (421, 39, 1, 2, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (422, 39, 1, 2, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (423, 39, 1, 2, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (424, 39, 1, 2, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (425, 39, 1, 2, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (426, 39, 1, 2, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (427, 39, 1, 2, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (428, 39, 1, 2, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (429, 39, 1, 2, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (430, 39, 1, 2, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (431, 39, 1, 2, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (432, 39, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (433, 39, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (434, 39, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (435, 39, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (436, 39, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (437, 39, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (438, 39, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (439, 39, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (440, 39, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (441, 39, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (442, 39, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (443, 39, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (444, 39, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (445, 39, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (446, 39, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (447, 39, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (448, 39, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (449, 39, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (450, 39, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (451, 39, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (452, 39, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (453, 39, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (454, 39, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (455, 39, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (456, 39, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (457, 39, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (458, 39, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (459, 39, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (460, 39, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (461, 39, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (462, 39, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (463, 39, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (464, 39, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (465, 39, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (466, 39, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (467, 40, 1, 4, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (468, 40, 1, 4, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (469, 40, 1, 4, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (470, 40, 1, 4, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (471, 40, 1, 4, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (472, 40, 1, 4, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (473, 40, 1, 4, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (474, 40, 1, 4, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (475, 40, 1, 4, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (476, 40, 1, 4, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (477, 40, 1, 4, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (478, 40, 1, 4, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (479, 40, 1, 4, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (480, 40, 1, 4, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (481, 40, 1, 4, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (482, 40, 1, 4, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (483, 40, 1, 4, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (484, 40, 1, 4, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (485, 40, 1, 4, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (486, 40, 1, 4, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (487, 40, 1, 4, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (488, 40, 1, 4, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (489, 40, 1, 4, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (490, 40, 1, 4, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (491, 41, 1, 128, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (492, 41, 1, 128, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (493, 41, 1, 128, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (494, 41, 1, 128, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (495, 41, 1, 128, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (496, 41, 1, 128, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (497, 41, 1, 128, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (498, 41, 1, 128, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (499, 41, 1, 128, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (500, 41, 1, 128, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (501, 41, 1, 128, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (502, 41, 1, 128, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (503, 41, 1, 128, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (504, 41, 2, 65664, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (505, 41, 2, 65664, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (506, 41, 2, 65664, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (507, 41, 2, 65664, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (508, 41, 2, 65664, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (509, 41, 2, 65664, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (510, 41, 2, 65664, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (511, 41, 2, 65664, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (512, 41, 2, 65664, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (513, 41, 2, 65664, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (514, 41, 2, 65664, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (515, 41, 1, 65536, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (516, 41, 1, 65536, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (517, 41, 1, 65536, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (518, 41, 1, 65536, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (519, 41, 1, 65536, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (520, 41, 1, 65536, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (521, 41, 1, 65536, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (522, 41, 1, 65536, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (523, 41, 1, 65536, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (524, 41, 1, 65536, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (525, 41, 1, 65536, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (526, 41, 1, 65536, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (527, 41, 1, 65536, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (528, 48, 1, 2, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (529, 48, 1, 2, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (530, 48, 1, 2, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (531, 48, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (532, 48, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (533, 48, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (534, 48, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (535, 48, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (536, 48, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (537, 48, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (538, 48, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (539, 48, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (540, 48, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (541, 48, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (542, 48, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (543, 48, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (544, 48, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (545, 48, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (546, 48, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (547, 48, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (548, 48, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (549, 48, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (550, 48, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (551, 48, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (552, 48, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (553, 48, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (554, 48, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (555, 48, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (556, 48, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (557, 48, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (558, 48, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (559, 48, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (560, 48, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (561, 48, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (562, 48, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (563, 48, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (564, 49, 1, 4, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (565, 49, 1, 4, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (566, 49, 1, 4, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (567, 49, 1, 4, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (568, 49, 1, 4, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (569, 49, 1, 4, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (570, 49, 1, 4, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (571, 49, 1, 4, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (572, 49, 1, 4, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (573, 49, 1, 4, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (574, 49, 1, 4, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (575, 49, 1, 4, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (576, 49, 1, 4, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (577, 49, 1, 4, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (578, 49, 1, 4, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (579, 49, 1, 4, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (580, 49, 1, 4, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (581, 49, 1, 4, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (582, 49, 1, 4, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (583, 49, 1, 4, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (584, 49, 1, 4, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (585, 49, 1, 4, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (586, 49, 1, 4, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (587, 49, 1, 4, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (588, 50, 2, 65664, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (589, 50, 2, 65664, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (590, 50, 2, 65664, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (591, 50, 2, 65664, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (592, 50, 2, 65664, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (593, 50, 2, 65664, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (594, 50, 2, 65664, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (595, 50, 2, 65664, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (596, 50, 2, 65664, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (597, 50, 2, 65664, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (598, 50, 2, 65664, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (599, 50, 2, 65664, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (600, 50, 2, 65664, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (601, 50, 2, 65664, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (602, 50, 2, 65664, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (603, 50, 2, 65664, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (604, 50, 2, 65664, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (605, 50, 2, 65664, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (606, 50, 2, 65664, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (607, 50, 2, 65664, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (608, 50, 2, 65664, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (609, 50, 2, 65664, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (610, 50, 2, 65664, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (611, 50, 2, 65664, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (612, 51, 1, 2, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (613, 51, 1, 2, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (614, 51, 1, 2, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (615, 51, 1, 2, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (616, 51, 1, 2, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (617, 51, 1, 2, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (618, 51, 1, 2, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (619, 51, 1, 2, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (620, 51, 1, 2, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (621, 51, 1, 2, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (622, 51, 1, 2, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (623, 51, 1, 2, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (624, 51, 1, 2, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (625, 51, 1, 2, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (626, 51, 1, 2, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (627, 51, 1, 2, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (628, 51, 1, 2, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (629, 51, 1, 2, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (630, 51, 1, 2, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (631, 51, 1, 2, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (632, 51, 1, 2, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (633, 51, 1, 2, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (634, 51, 1, 2, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (635, 51, 1, 2, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (636, 51, 1, 2, N'MCC Score', N'2019_02', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (637, 51, 1, 2, N'MCC Score', N'2019_03', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (638, 51, 1, 2, N'MCC Score', N'2019_04', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (639, 51, 1, 2, N'MCC Score', N'2019_05', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (640, 51, 1, 2, N'MCC Score', N'2019_06', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (641, 51, 1, 2, N'MCC Score', N'2019_07', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (642, 51, 1, 2, N'MCC Score', N'2019_08', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (643, 51, 1, 2, N'MCC Score', N'2019_09', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (644, 51, 1, 2, N'MCC Score', N'2019_10', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (645, 51, 1, 2, N'MCC Score', N'2019_11', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (646, 51, 1, 2, N'MCC Score', N'2019_12', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (647, 51, 1, 2, N'MCC Score', N'2020_01', 1, 2020, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (648, 52, 1, 4, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (649, 52, 1, 4, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (650, 52, 1, 4, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (651, 52, 1, 4, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (652, 52, 1, 4, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (653, 52, 1, 4, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (654, 52, 1, 4, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (655, 52, 1, 4, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (656, 52, 1, 4, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (657, 52, 1, 4, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (658, 52, 1, 4, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (659, 52, 1, 4, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (660, 52, 1, 4, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (661, 52, 1, 4, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (662, 52, 1, 4, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (663, 52, 1, 4, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (664, 52, 1, 4, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (665, 52, 1, 4, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (666, 52, 1, 4, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (667, 52, 1, 4, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (668, 52, 1, 4, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (669, 52, 1, 4, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (670, 52, 1, 4, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (671, 52, 1, 4, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (672, 53, 1, 128, N'MCC Score', N'2016_01', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (673, 53, 1, 128, N'MCC Score', N'2016_02', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (674, 53, 1, 128, N'MCC Score', N'2016_03', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (675, 53, 1, 128, N'MCC Score', N'2016_04', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (676, 53, 1, 128, N'MCC Score', N'2016_05', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (677, 53, 1, 128, N'MCC Score', N'2016_06', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (678, 53, 1, 128, N'MCC Score', N'2016_07', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (679, 53, 1, 128, N'MCC Score', N'2016_08', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (680, 53, 1, 128, N'MCC Score', N'2016_09', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (681, 53, 1, 128, N'MCC Score', N'2016_10', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (682, 53, 1, 128, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (683, 53, 1, 128, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (684, 53, 1, 128, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (685, 53, 2, 65664, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (686, 53, 2, 65664, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (687, 53, 2, 65664, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (688, 53, 2, 65664, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (689, 53, 2, 65664, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (690, 53, 2, 65664, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (691, 53, 2, 65664, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (692, 53, 2, 65664, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (693, 53, 2, 65664, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (694, 53, 2, 65664, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (695, 53, 2, 65664, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (696, 53, 1, 65536, N'MCC Score', N'2018_01', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (697, 53, 1, 65536, N'MCC Score', N'2018_02', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (698, 53, 1, 65536, N'MCC Score', N'2018_03', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (699, 53, 1, 65536, N'MCC Score', N'2018_04', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (700, 53, 1, 65536, N'MCC Score', N'2018_05', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (701, 53, 1, 65536, N'MCC Score', N'2018_06', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (702, 53, 1, 65536, N'MCC Score', N'2018_07', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (703, 53, 1, 65536, N'MCC Score', N'2018_08', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (704, 53, 1, 65536, N'MCC Score', N'2018_09', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (705, 53, 1, 65536, N'MCC Score', N'2018_10', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (706, 53, 1, 65536, N'MCC Score', N'2018_11', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (707, 53, 1, 65536, N'MCC Score', N'2018_12', 1, 2018, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (708, 53, 1, 65536, N'MCC Score', N'2019_01', 1, 2019, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (709, 60, 4, 126, N'MCC Score', N'2016_11', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (710, 60, 4, 126, N'MCC Score', N'2016_12', 1, 2016, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (711, 60, 4, 126, N'MCC Score', N'2017_01', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (712, 60, 4, 126, N'MCC Score', N'2017_02', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (713, 60, 4, 126, N'MCC Score', N'2017_03', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (714, 60, 4, 126, N'MCC Score', N'2017_04', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (715, 60, 4, 126, N'MCC Score', N'2017_05', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (716, 60, 4, 126, N'MCC Score', N'2017_06', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (717, 60, 4, 126, N'MCC Score', N'2017_07', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (718, 60, 4, 126, N'MCC Score', N'2017_08', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (719, 60, 4, 126, N'MCC Score', N'2017_09', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (720, 60, 4, 126, N'MCC Score', N'2017_10', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (721, 60, 4, 126, N'MCC Score', N'2017_11', 1, 2017, 1, 1, NULL, NULL)
GO
INSERT [Fact].[SeverityScores] ([ID], [Id_Patient], [Severity_Score], [comb_id], [ScoreType], [date_YearMonth], [measure_IndicatorInd], [sys_PartitionDate], [FlagNew], [ScoreTypeId], [date_Score], [id_IndexAdmission]) VALUES (722, 60, 4, 126, N'MCC Score', N'2017_12', 1, 2017, 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [Fact].[SeverityScores] OFF
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [dbmSemanticAnalytics]
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201604, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201605, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201606, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201607, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201608, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201609, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201610, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201611, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201612, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201701, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201702, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201703, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201704, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201705, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 1, 201706, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201603, 1, 1, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201604, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201605, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201606, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201607, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201608, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201609, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201610, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201611, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201612, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201701, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201702, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201703, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201704, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201705, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1411, 19, 201706, 1, 0, 1, N' Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201603, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201604, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201605, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201606, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201607, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201608, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201703, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201704, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201705, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 19, 201706, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201603, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201604, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201605, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201606, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201607, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201608, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201704, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201705, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1421, 1, 201706, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 1, 201703, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201603, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1422, 19, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201604, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201605, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201606, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201607, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201608, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201609, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201610, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201611, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201612, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201701, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201702, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201704, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201705, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 18, 201706, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201703, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201604, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201605, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201606, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201607, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201608, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201604, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201605, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201606, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201607, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201608, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201609, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201610, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201611, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201612, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201701, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201702, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201704, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 1, 201705, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1611, 7, 201706, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 1, 201603, 1, 0, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 1, 201703, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 1, 201704, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 1, 201705, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 1, 201706, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 7, 201704, 1, 0, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 7, 201705, 1, 0, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 7, 201706, 1, 0, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 7, 201603, 1, 0, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201603, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201604, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201605, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201606, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201607, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201608, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201609, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201610, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201611, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201612, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201701, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201702, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201703, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201704, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201705, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1612, 18, 201706, 1, 1, 1, N'Normal BMI', N'Normal BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201603, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201604, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201605, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201606, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201607, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201608, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201609, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201610, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201611, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201612, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201701, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201702, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 18, 201703, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 7, 201704, 1, 1, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 7, 201705, 1, 1, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 7, 201706, 1, 1, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 7, 201603, 1, 1, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 1, 201603, 1, 1, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 1, 201703, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 1, 201704, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 1, 201705, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1613, 1, 201706, 1, 0, 2, N'High BMI', N'High BMI', N'CQM', 1, 1611)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201603, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201604, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201605, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201606, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201607, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201608, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201609, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201610, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201611, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201612, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201701, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201702, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201703, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201704, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201705, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 1, 201706, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201604, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201605, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201606, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201607, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201608, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201609, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201610, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201611, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201612, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201701, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201702, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201703, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201704, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201705, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201706, 1, 1, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1614, 7, 201603, 1, 0, 1, N'Received', N'Not Received', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201604, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201605, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201606, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201607, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201608, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201609, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201610, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201611, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201612, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201701, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201702, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201703, 1, 0, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201704, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201705, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1615, 7, 201706, 1, 1, 2, N'High BP despite Pharmacotherapy', N'High BP despite Pharmacotherapy', N'CQM', 1, -1)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201604, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201605, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201606, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201607, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201608, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201609, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201610, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201611, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201612, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201701, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201702, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201703, 1, 1, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201704, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201705, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1616, 7, 201706, 1, 0, 2, N'Very High BP despite Pharmacotherapy', N'Very High BP despite Pharmacotherapy', N'CQM', 1, 1615)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201604, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201605, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201606, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201607, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201608, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201609, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201610, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201611, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201612, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201701, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201702, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201704, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201705, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 1, 201706, 1, 0, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201704, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201705, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201706, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201703, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201604, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201603, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201605, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201606, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201607, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201608, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201609, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201610, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201611, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201612, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201701, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1620, 7, 201702, 1, 1, 1, N'Performed', N'Not Performed', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201603, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201604, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201605, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201606, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201607, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201608, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201609, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201610, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201611, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201612, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201701, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201702, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201703, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201704, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201705, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 7, 201706, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201603, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201604, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201605, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201606, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201607, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201608, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201609, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201610, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201611, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201612, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201701, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201702, 1, 0, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1621, 1, 201703, 1, 1, 1, N'Normal BP', N'Normal BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201603, 1, 1, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201604, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201605, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201606, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201607, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201608, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201609, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201610, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201611, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201612, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201701, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201702, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 1, 201703, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201603, 1, 1, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201604, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201605, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201606, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201607, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201608, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201609, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201610, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201611, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201612, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201701, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201702, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201703, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201704, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201705, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1622, 7, 201706, 1, 0, 1, N'Elevated BP', N'Elevated BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201603, 1, 0, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201604, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201605, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201606, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201607, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201608, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201609, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201610, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201611, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201612, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201701, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201702, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201703, 1, 0, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201704, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201705, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 7, 201706, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201603, 1, 0, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201604, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201605, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201606, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201607, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201608, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201609, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201610, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201611, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201612, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201701, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201702, 1, 1, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1623, 1, 201703, 1, 0, 2, N'High BP', N'High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201603, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201604, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201605, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201606, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201607, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201608, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201609, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201610, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201611, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201612, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201701, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201702, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 1, 201703, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201603, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201604, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201605, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201606, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201607, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201608, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201609, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201610, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201611, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201612, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201701, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201702, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201703, 1, 1, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201704, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201705, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
INSERT [Fact].[Metrics_CQM_Full] ([MetricKey], [id_Patient], [date_yearMonth], [measure_DenominatorInd], [measure_NumeratorInd], [ImpN], [MeasureCompliance], [MeasureNotCompliance], [Level1Desc], [Level1], [Parent Monitoring Key]) VALUES (1624, 7, 201706, 1, 0, 2, N'Very High BP', N'Very High BP', N'CQM', 1, 1620)
GO
