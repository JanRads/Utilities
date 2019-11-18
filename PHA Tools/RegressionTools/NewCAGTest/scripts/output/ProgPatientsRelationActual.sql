use dbmSemanticAnalytics

select id_Patient, b.ProgramName, a.fromDate_Relation, a.toDate_Relation from 
[Fact].[PatientProgramRelations] a
inner join dim.Programs b on
a.id_Program = b.id_Program


order by 1, 2
