USE [AIS20180712164136]
GO

/****** Object:  Trigger [dbo].[Synchronize_ProjectNumber]    Script Date: 2019-05-31 09:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Synchronize_ProjectNumber] ON [dbo].[t_Item_3003]
FOR INSERT,UPDATE,DELETE 
AS
BEGIN

--ÐÂÔö
IF(EXISTS(SELECT 1 FROM inserted t WHERE NOT EXISTS(SELECT 1 FROM deleted t2 WHERE t.fitemid = t2.fitemid)))
BEGIN

INSERT INTO TESTDB.DBO.Synchronize_DataTable (
SynType	
,JsonText	
,IsFinish	
,ErrorMsg	
,DataType	
,DateInsert 
)
select 
'Save'
,'{"Data":{"F_101":null,"FName":"'+ FName +'","FNumber":"'+ FNumber +'","FOtherAPAcctID":{"FName":"","FNumber":""},"FOtherARAcctID":{"FName":"","FNumber":""},"FPreAPAcctID":{"FName":"","FNumber":""},"FPreARAcctID":{"FName":"","FNumber":""}}}'
,0,'','ItemClass3003',CONVERT(varchar(23),GETDATE(),121)
from inserted

END

--É¾³ý
IF EXISTS(SELECT 1 FROM deleted t1 WHERE NOT EXISTS(SELECT 1 FROM inserted t2 WHERE t1.FItemID = t2.FItemID))
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
,'{"Data":{"FNumber":"'+ FNumber +'"},"FDelete":"5"}'
,0,'','ItemClass3003',CONVERT(VARCHAR(23),GETDATE(),121)
FROM deleted


END


IF EXISTS(SELECT 1 FROM inserted t1 JOIN deleted t2 ON t1.FItemID = t2.FItemID)
BEGIN 

INSERT INTO TESTDB.DBO.Synchronize_DataTable (
SynType	
,JsonText	
,IsFinish	
,ErrorMsg	
,DataType	
,DateInsert 
)
SELECT 'Update'
,'{"Data":{"FNumber":"'+ t2.FNumber +'","Data":{"F_101":'+ ISNULL('"'+t2.FNumber+'"','null') +',"FName":"'+ t1.FName +'","FNumber":"'+ t1.FNumber +'","FOtherAPAcctID":{"FName":"","FNumber":""},"FOtherARAcctID":{"FName":"","FNumber":""},"FPreAPAcctID":{"FName":"","FNumber":""},"FPreARAcctID":{"FName":"","FNumber":""}}}}'
,0,'','ItemClass3003',CONVERT(VARCHAR(23),GETDATE(),121)
 FROM 
inserted t1 
JOIN deleted t2 ON t1.FItemID = t2.FItemID

END


END




GO


