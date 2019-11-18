  --Expected Readmissions Payor
  select  R.id_Patient as Patient ,isnull(DP.[ProgramName], 'UNKNOW') as Payor
  	  ,count( R.[measure_ReadmissionInd]) as [Count Readmissions]
      ,isnull(sum( R.[measure_LengthOfStay_Readmission]),0) as [Los Readmissions]
  FROM            Fact.Readmissions R LEFT OUTER JOIN                          
        (SELECT        F.id_Patient, F.id_CombProg, F.FromDate, T.ToDate
		 FROM   (SELECT     distinct   id_Patient, id_CombProg, date_Relationship AS FromDate
                FROM            Fact.PatientProgramCombRelations
                WHERE        (measure_PatientCount = 1)) AS F INNER JOIN
					(SELECT    distinct    id_Patient, id_CombProg, date_Relationship AS ToDate
						FROM            Fact.PatientProgramCombRelations AS PatientProgramCombRelations_1
						WHERE        (measure_PatientCount = - 1)) AS T ON F.id_Patient = T.id_Patient AND F.id_CombProg = T.id_CombProg) AS bb 
ON  ISNULL(R.date_DischargeIndexAdmission, R.date_IndexAdmission) BETWEEN bb.FromDate AND bb.ToDate AND 
                         R.id_Patient = bb.id_Patient
left join [dbmSemanticAnalytics].[Factless].[CombPrograms] CP
on CP.[id_CombProg]= bb.id_CombProg
left join [dbmSemanticAnalytics].[Dim].[Programs] DP
  on DP.id_Program = cp.[id_Programs]
   group by  R.id_Patient,cp.[id_Programs]  ,DP.[ProgramName]