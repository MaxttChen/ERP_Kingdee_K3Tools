USE [AIS20180712164136]
GO

/****** Object:  Trigger [dbo].[Synchronize_forbidden_projectNumber]    Script Date: 2019-05-31 09:23:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Synchronize_forbidden_projectNumber] ON [dbo].[t_Item]
FOR UPDATE 
AS 
BEGIN	

	IF EXISTS(SELECT 1 FROM inserted t1 JOIN deleted t2 ON t1.fitemid  = t2.FItemID WHERE t1.FDeleted <> t2.FDeleted AND t1.FItemClassID = 3003)
	BEGIN
			
		INSERT INTO TESTDB.DBO.Synchronize_DataTable (
		SynType	
		,JsonText	
		,IsFinish	
		,ErrorMsg	
		,DataType	
		,DateInsert 
		)
		SELECT 
		'Delete'
		,'{"Data":{"FNumber":"'+ t1.fnumber +'"},"FDelete":"'+ CASE WHEN t1.FDeleted = 0 AND t2.FDeleted = 1 THEN '0' ELSE '1' END +'"}'
		,0,'','ItemClass3003',CONVERT(VARCHAR(23),GETDATE(),121)
		FROM inserted t1
		JOIN deleted t2 ON t1.FItemID = t2.FItemID

	END

END


GO


