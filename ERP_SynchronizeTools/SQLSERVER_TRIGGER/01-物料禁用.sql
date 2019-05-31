USE [AIS20180712164136]
GO

/****** Object:  Trigger [dbo].[Synchronize_item_forbidden]    Script Date: 2019-05-31 09:18:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[Synchronize_item_forbidden] ON [dbo].[t_ICItemCore]
FOR UPDATE
AS
BEGIN
	

	--物料同步，禁用和反禁用
	IF UPDATE(FDELETED) AND EXISTS(SELECT 1 FROM Inserted WHERE 1=1 AND SUBSTRING(FNumber,1,1) NOT IN ('3','7'))
	BEGIN
		INSERT INTO TESTDB..Synchronize_DataTable
		(
			SynType,
			JsonText,
			IsFinish,
			ErrorMsg,
			DataType,
			DateInsert
		)
		SELECT  'Delete'
		,'{"Data":{"FNumber":"'+t1.FNumber+'"},"FDelete":"'+
		CASE WHEN T1.FDeleted = 0  THEN '0' ELSE '1'END
		+'"}'
		,0,'','Material',CONVERT(VARCHAR(22),GETDATE(),121)
		FROM Inserted T1 


	END
	
END



GO


