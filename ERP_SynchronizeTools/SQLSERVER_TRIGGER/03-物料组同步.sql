USE [AIS20180712164136]
GO

/****** Object:  Trigger [dbo].[Synchronize_ItemGroup]    Script Date: 2019-05-31 09:22:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Synchronize_ItemGroup] ON [dbo].[t_Item]
FOR INSERT , UPDATE , DELETE
AS 
BEGIN 
	/*物料组同步触发器*/
	/*触发器创建日期：2019年5月8日08:44:50*/
	--物料组新增


	IF EXISTS(SELECT 1 FROM Inserted WHERE Inserted.FDetail = 0 AND Inserted.FItemClassID = 4 
			AND SUBSTRING(Inserted.FNumber , 1 , 1 ) NOT IN ('3','7')
			AND NOT EXISTS (SELECT 1 FROM Deleted WHERE Deleted.FDetail = 0 AND Deleted.FItemID=Inserted.FItemID 
			AND Deleted.FItemClassID=Inserted.FItemClassID))
	BEGIN 
		INSERT INTO TESTDB.dbo.Synchronize_DataTable
		(
			SynType,
			JsonText,
			IsFinish,
			ErrorMsg,
			DataType,
			DateInsert,
			FinishCode_test,
			ErrorMsg_test
		)
		SELECT  'Save'
		,'{"Data":{"FName":"'+Inserted.FName+'","FNumber":"'+Inserted.FNumber+'","FUNDetail":1}}'
		,0,'','MaterialGroup',CONVERT(VARCHAR(22),GETDATE(),121),NULL,NULL  FROM Inserted 
		WHERE Inserted.FItemClassID IN ('4')
		AND Inserted.FDetail = 0 
	END

	--物料组新增
	IF EXISTS(SELECT 1 FROM Inserted WHERE Inserted.FDetail = 0 AND Inserted.FItemClassID = 4 
			AND SUBSTRING(Inserted.FNumber , 1 , 1 ) NOT IN ('3','7')
			AND EXISTS (SELECT 1 FROM Deleted WHERE Deleted.FDetail = 0 AND Deleted.FItemID=Inserted.FItemID  
							AND Deleted.FDeleted=Inserted.FDeleted AND Deleted.FItemClassID=Inserted.FItemClassID))
	BEGIN 
		INSERT INTO TESTDB.dbo.Synchronize_DataTable
		(
			SynType,
			JsonText,
			IsFinish,
			ErrorMsg,
			DataType,
			DateInsert,
			FinishCode_test,
			ErrorMsg_test
		)
		SELECT  'Update'
		,'{"Data":{"FNumber":"'+Deleted.FNumber+'","Data":{"FName":"'+Inserted.FName+'","FNumber":"'+Inserted.FNumber+'","FUNDetail":1}}}'
		,0,'','MaterialGroup',CONVERT(VARCHAR(22),GETDATE(),121),NULL,NULL  
		FROM Inserted 
		JOIN Deleted ON Deleted.FItemID=Inserted.FItemID
		WHERE Inserted.FItemClassID IN ('4')
		AND Inserted.FDetail = 0 
	END

	--物料组禁用和反禁用
	IF EXISTS(SELECT 1 FROM Inserted WHERE Inserted.FDetail = 0 AND Inserted.FItemClassID = 4 
			AND SUBSTRING(Inserted.FNumber , 1 , 1 ) NOT IN ('3','7')
			AND EXISTS (SELECT 1 FROM Deleted WHERE Deleted.FDetail = 0 AND Deleted.FItemID=Inserted.FItemID 
							AND Deleted.FDeleted<>Inserted.FDeleted  AND Deleted.FItemClassID=Inserted.FItemClassID))
	BEGIN 
		INSERT INTO TESTDB.dbo.Synchronize_DataTable
		(
			SynType,
			JsonText,
			IsFinish,
			ErrorMsg,
			DataType,
			DateInsert,
			FinishCode_test,
			ErrorMsg_test
		)
		SELECT  'Delete'
		,'{"Data":{"FNumber":"'+Deleted.FNumber+'"},"FDelete":"'+
		CASE WHEN Inserted.FDeleted = 0 THEN '0' ELSE '1' END
		+'"}'
		,0,'','MaterialGroup',CONVERT(VARCHAR(22),GETDATE(),121),NULL,NULL  
		FROM Inserted 
		JOIN Deleted ON Deleted.FItemID=Inserted.FItemID
		WHERE Inserted.FItemClassID IN ('4')
		AND Inserted.FDetail = 0 
	END

	--物料组删除
	IF EXISTS(SELECT 1 FROM  Deleted WHERE Deleted.FDetail = 0 AND Deleted.FItemClassID = 4 
			AND SUBSTRING(Deleted.FNumber , 1 , 1 ) NOT IN ('3','7')
			AND NOT EXISTS (SELECT 1 FROM Inserted WHERE Inserted.FDetail = 0 AND Deleted.FItemID=Inserted.FItemID))
	BEGIN 
		INSERT INTO TESTDB.dbo.Synchronize_DataTable
		(
			SynType,
			JsonText,
			IsFinish,
			ErrorMsg,
			DataType,
			DateInsert,
			FinishCode_test,
			ErrorMsg_test
		)
		SELECT  'Delete'
		,'{"Data":{"FNumber":"'+Deleted.FNumber+'"},"FDelete":"5"}'
		,0,'','MaterialGroup',CONVERT(VARCHAR(22),GETDATE(),121),NULL,NULL  
		FROM Deleted 
		WHERE Deleted.FItemClassID IN ('4')
		AND Deleted.FDetail = 0 
	END


END

GO


