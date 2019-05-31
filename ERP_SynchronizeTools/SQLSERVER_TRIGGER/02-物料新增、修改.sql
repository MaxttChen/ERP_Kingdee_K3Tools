USE [AIS20180712164136]
GO

/****** Object:  Trigger [dbo].[TR_t_ICItem]    Script Date: 2019-05-31 09:20:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TR_t_ICItem] ON [dbo].[t_ICItem]      
        INSTEAD OF INSERT,UPDATE,DELETE      
        AS      
        BEGIN      
           BEGIN TRANSACTION      
           SET NOCOUNT ON      
           IF EXISTS(SELECT * FROM Deleted)      
           BEGIN      
            DELETE t_ICItemCore FROM t_ICItemCore INNER JOIN Deleted      
                ON t_ICItemCore.FItemID=Deleted.FItemID      
                DELETE t_ICItemBase FROM t_ICItemBase INNER JOIN Deleted      
                ON t_ICItemBase.FItemID=Deleted.FItemID      
                DELETE t_ICItemMaterial FROM t_ICItemMaterial INNER JOIN Deleted      
                ON t_ICItemMaterial.FItemID=Deleted.FItemID       
                DELETE t_ICItemPlan FROM t_ICItemPlan INNER JOIN Deleted       
                ON t_ICItemPlan.FItemID=Deleted.FItemID      
                DELETE t_ICItemDesign FROM t_ICItemDesign INNER JOIN Deleted       
                ON t_ICItemDesign.FItemID=Deleted.FitemID      
                DELETE t_ICItemStandard FROM t_ICItemStandard INNER JOIN Deleted      
                ON t_ICItemStandard.FItemID=Deleted.FItemID      
                DELETE t_ICItemQuality FROM t_ICItemQuality INNER JOIN Deleted      
                ON t_ICItemQuality.FItemID=Deleted.FItemID      
                DELETE T_BASE_ICItemEntrance FROM T_BASE_ICItemEntrance INNER JOIN Deleted      
                ON T_BASE_ICItemEntrance.FItemID=Deleted.FItemID      
                DELETE t_ICItemCustom FROM t_ICItemCustom INNER JOIN Deleted      
                ON t_ICItemCustom.FItemID=Deleted.FItemID      
                    
            END      
            IF EXISTS (SELECT * FROM Inserted)      
            BEGIN    
        
        INSERT INTO t_ICItemCore ( FItemID,FModel,FName,FHelpCode,FDeleted,FShortNumber,FNumber,FParentID,FBrNo,FTopID,FRP,FOmortize,FOmortizeScale,FForSale,FStaCost,FOrderPrice,FOrderMethod,FPriceFixingType,FSalePriceFixingType,FPerWastage,FARAcctID,FPlanPriceMethod,FPlanClass,FPY,FPinYin)
 SELECT FItemID,FModel,FName,FHelpCode,ISNULL(FDeleted,0),FShortNumber,FNumber,ISNULL(FParentID,0),ISNULL(FBrNo,'0'),ISNULL(FTopID,0),FRP,FOmortize,FOmortizeScale,ISNULL(FForSale,0),FStaCost,FOrderPrice,FOrderMethod,FPriceFixingType,FSalePriceFixingType,ISNULL(FPerWastage,0),FARAcctID,FPlanPriceMethod,FPlanClass,ISNULL(FPY,' '),ISNULL(FPinYin,' ') FROM Inserted
    INSERT INTO t_ICItemBase ( FItemID,FErpClsID,FUnitID,FUnitGroupID,FDefaultLoc,FSPID,FSource,FQtyDecimal,FLowLimit,FHighLimit,FSecInv,FUseState,FIsEquipment,FEquipmentNum,FIsSparePart,FFullName,FSecUnitID,FSecCoefficient,FSecUnitDecimal,FAlias,FOrderUnitID,FSaleUnitID,FStoreUnitID,FProductUnitID,FApproveNo,FAuxClassID,FTypeID,FPreDeadLine,FSerialClassID,FDefaultReadyLoc,FSPIDReady,FDSManagerID,FForbbitBarcodeEdit)
 SELECT FItemID,FErpClsID,ISNULL(FUnitID,0),ISNULL(FUnitGroupID,0),FDefaultLoc,ISNULL(FSPID,0),FSource,ISNULL(FQtyDecimal,2),ISNULL(FLowLimit,0),ISNULL(FHighLimit,0),ISNULL(FSecInv,1),ISNULL(FUseState,341),ISNULL(FIsEquipment,0),FEquipmentNum,ISNULL(FIsSparePart,0),FFullName,ISNULL(FSecUnitID,0),ISNULL(FSecCoefficient,0),ISNULL(FSecUnitDecimal,0),FAlias,ISNULL(FOrderUnitID,0),ISNULL(FSaleUnitID,0),ISNULL(FStoreUnitID,0),ISNULL(FProductUnitID,0),FApproveNo,ISNULL(FAuxClassID,0),FTypeID,FPreDeadLine,ISNULL(FSerialClassID,0),ISNULL(FDefaultReadyLoc,0),ISNULL(FSPIDReady,0),FDSManagerID,FForbbitBarcodeEdit FROM Inserted
    INSERT INTO t_ICItemMaterial ( FItemID,FOrderRector,FPOHghPrcMnyType,FPOHighPrice,FWWHghPrc,FWWHghPrcMnyType,FSOLowPrc,FSOLowPrcMnyType,FIsSale,FProfitRate,FSalePrice,FBatchManager,FISKFPeriod,FKFPeriod,FTrack,FPlanPrice,FPriceDecimal,FAcctID,FSaleAcctID,FCostAcctID,FAPAcctID,FGoodSpec,FCostProject,FIsSnManage,FStockTime,FBookPlan,FBeforeExpire,FTaxRate,FAdminAcctID,FNote,FIsSpecialTax,FSOHighLimit,FSOLowLimit,FOIHighLimit,FOILowLimit,FDaysPer,FLastCheckDate,FCheckCycle,FCheckCycUnit,FStockPrice,FABCCls,FBatchQty,FClass,FCostDiffRate,FDepartment,FSaleTaxAcctID,FCBBmStandardID,FCBRestore,FPickHighLimit,FPickLowLimit,FOnlineShopPName,FOnlineShopPNo,FUnitPackageNumber,FOrderDept)
 SELECT FItemID,FOrderRector,isnull(FPOHghPrcMnyType,1),isnull(FPOHighPrice,0),FWWHghPrc,isnull(FWWHghPrcMnyType,1),FSOLowPrc,isnull(FSOLowPrcMnyType,1),isnull(FIsSale,' '),FProfitRate,FSalePrice,isnull(FBatchManager,0),isnull(FISKFPeriod,0),isnull(FKFPeriod,0),FTrack,FPlanPrice,isnull(FPriceDecimal,2),FAcctID,FSaleAcctID,FCostAcctID,FAPAcctID,isnull(FGoodSpec,0),isnull(FCostProject,0),FIsSnManage,isnull(FStockTime,0),FBookPlan,FBeforeExpire,isnull(FTaxRate,17),isnull(FAdminAcctID,0),FNote,FIsSpecialTax,isnull(FSOHighLimit,100),isnull(FSOLowLimit,100),isnull(FOIHighLimit,100),isnull(FOILowLimit,100),FDaysPer,FLastCheckDate,FCheckCycle,FCheckCycUnit,isnull(FStockPrice,0),FABCCls,FBatchQty,isnull(FClass,0),FCostDiffRate,isnull(FDepartment,0),FSaleTaxAcctID,isnull(FCBBmStandardID,0),FCBRestore,FPickHighLimit,FPickLowLimit,FOnlineShopPName,FOnlineShopPNo,FUnitPackageNumber,FOrderDept FROM Inserted
    INSERT INTO t_ICItemPlan ( FItemID,FPlanTrategy,FOrderTrategy,FLeadTime,FFixLeadTime,FTotalTQQ,FQtyMin,FQtyMax,FCUUnitID,FOrderInterVal,FBatchAppendQty,FOrderPoint,FBatFixEconomy,FBatChangeEconomy,FRequirePoint,FPlanPoint,FDefaultRoutingID,FDefaultWorkTypeID,FProductPrincipal,FDailyConsume,FMRPCon,FPlanner,FPutInteger,FInHighLimit,FInLowLimit,FLowestBomCode,FMRPOrder,FIsCharSourceItem,FCharSourceItemID,FPlanMode,FCtrlType,FCtrlStraregy,FContainerName,FKanBanCapability,FIsBackFlush,FBackFlushStockID,FBackFlushSPID,FBatchSplitDays,FBatchSplit,FIsFixedReOrder,FAuxInMrpCal,FProductDesigner)
 SELECT FItemID,isnull(FPlanTrategy,321),isnull(FOrderTrategy,331),isnull(FLeadTime,0),isnull(FFixLeadTime,0),isnull(FTotalTQQ,1),isnull(FQtyMin,1),isnull(FQtyMax,10000),isnull(FCUUnitID,0),isnull(FOrderInterVal,1),FBatchAppendQty,isnull(FOrderPoint,1),isnull(FBatFixEconomy,1),isnull(FBatChangeEconomy,1),isnull(FRequirePoint,1),isnull(FPlanPoint,1),isnull(FDefaultRoutingID,1),isnull(FDefaultWorkTypeID,0),isnull(FProductPrincipal,' '),FDailyConsume,isnull(FMRPCon,1),FPlanner,isnull(FPutInteger,0),isnull(FInHighLimit,0),isnull(FInLowLimit,0),FLowestBomCode,isnull(FMRPOrder,0),FIsCharSourceItem,FCharSourceItemID,isnull(FPlanMode,14036),FCtrlType,FCtrlStraregy,FContainerName,FKanBanCapability,isnull(FIsBackFlush,0),FBackFlushStockID,FBackFlushSPID,isnull(FBatchSplitDays,0),isnull(FBatchSplit,0),isnull(FIsFixedReOrder,0),FAuxInMrpCal,FProductDesigner FROM Inserted
    INSERT INTO t_ICItemDesign ( FItemID,FChartNumber,FIsKeyItem,FMaund,FGrossWeight,FNetWeight,FCubicMeasure,FLength,FWidth,FHeight,FSize,FVersion,FStartService,FMakeFile,FIsFix,FTtermOfService,FTtermOfUsefulTime)
 SELECT FItemID,FChartNumber,isnull(FIsKeyItem,0),isnull(FMaund,0),isnull(FGrossWeight,0),isnull(FNetWeight,0),isnull(FCubicMeasure,0),isnull(FLength,0),isnull(FWidth,0),isnull(FHeight,0),isnull(FSize,0),FVersion,isnull(FStartService,0),isnull(FMakeFile,0),isnull(FIsFix,0),isnull(FTtermOfService,0),isnull(FTtermOfUsefulTime,0) FROM Inserted
    INSERT INTO t_ICItemStandard ( FItemID,FStandardCost,FStandardManHour,FStdPayRate,FChgFeeRate,FStdFixFeeRate,FOutMachFee,FPieceRate,FStdBatchQty,FPOVAcctID,FPIVAcctID,FMCVAcctID,FPCVAcctID,FSLAcctID,FCAVAcctID,FCBAppendRate,FCBAppendProject,FCostBomID,FCBRouting,FOutMachFeeProject)
 SELECT FItemID,isnull(FStandardCost,0),isnull(FStandardManHour,0),isnull(FStdPayRate,0),isnull(FChgFeeRate,0),isnull(FStdFixFeeRate,0),isnull(FOutMachFee,0),isnull(FPieceRate,0),isnull(FStdBatchQty,1),FPOVAcctID,FPIVAcctID,FMCVAcctID,FPCVAcctID,FSLAcctID,FCAVAcctID,FCBAppendRate,FCBAppendProject,isnull(FCostBomID,0),isnull(FCBRouting,0),FOutMachFeeProject FROM Inserted
    INSERT INTO t_ICItemQuality ( FItemID,FInspectionLevel,FInspectionProject,FIsListControl,FProChkMde,FWWChkMde,FSOChkMde,FWthDrwChkMde,FStkChkMde,FOtherChkMde,FStkChkPrd,FStkChkAlrm,FIdentifier,FSampStdCritical,FSampStdStrict,FSampStdSlight)
 SELECT FItemID,isnull(FInspectionLevel,352),isnull(FInspectionProject,0),FIsListControl,FProChkMde,FWWChkMde,FSOChkMde,FWthDrwChkMde,FStkChkMde,FOtherChkMde,isnull(FStkChkPrd,9999),isnull(FStkChkAlrm,0),isnull(FIdentifier,' '),FSampStdCritical,FSampStdStrict,FSampStdSlight FROM Inserted
    INSERT INTO T_BASE_ICItemEntrance ( FItemID,FNameEn,FModelEn,FHSNumber,FFirstUnit,FSecondUnit,FFirstUnitRate,FSecondUnitRate,FIsManage,FPackType,FLenDecimal,FCubageDecimal,FWeightDecimal,FImpostTaxRate,FConsumeTaxRate,FManageType,FExportRate)
 SELECT FItemID,FNameEn,FModelEn,FHSNumber,FFirstUnit,FSecondUnit,isnull(FFirstUnitRate,0),isnull(FSecondUnitRate,0),isnull(FIsManage,0),FPackType,isnull(FLenDecimal,2),isnull(FCubageDecimal,4),isnull(FWeightDecimal,2),isnull(FImpostTaxRate,0),isnull(FConsumeTaxRate,0),FManageType,FExportRate FROM Inserted
    INSERT INTO t_ICItemCustom(F_102,F_103,FItemID) SELECT  F_102,F_103,FItemID FROM Inserted    
        END    



/***************/
--IF EXISTS(SELECT 1 FROM INSERTED T1 JOIN DELETED T2 ON T1.FITEMID = T2.FITEMID  WHERE T1.FMODEL<>T2.FMODEL)
--BEGIN

--	IF EXISTS(SELECT 1 FROM INSERTED T1 WHERE EXISTS ( SELECT 1 FROM POORDERENTRY T2 JOIN POORDER T3 ON T2.FINTERID = T3.FINTERID WHERE T1.FITEMID = T2.FITEMID AND T3.FSTATUS > 0 ))
--	BEGIN

--		RAISERROR('物料号已经被采购订单使用不能修改！',18,18)
--		ROLLBACK TRAN 

--	END
--END



/*******************************************/
/*******************************************/
/*******************************************/
/*******************************************/
/********物料号同步*******/
--新增
--项目总成3,和焊接制品7不作同步处理
IF EXISTS(SELECT 1 FROM Inserted WHERE 1=1 AND SUBSTRING(FNumber,1,1) NOT IN ('3','7') AND NOT EXISTS(SELECT 1 FROM Deleted))
BEGIN
	CREATE TABLE #TEMP (FStaticStr NVARCHAR(MAX), FJson NVARCHAR(MAX))

	INSERT INTO #TEMP
	SELECT 
	'{"Data":{"FAcctID":{"FName":"库存现金","FNumber":"1001"},"FAdminAcctID":{"FName":"","FNumber":""},"FAlias":null,"FAPAcctID":{"FName":"","FNumber":""},"FApproveNo":null,"FAuxClassID":{"FName":"","FNumber":""},"FAuxInMrpCal":false,"FBackFlushSPID":{"FName":"","FNumber":""},"FBackFlushStockID":{"FName":"","FNumber":""},"FBatChangeEconomy":1,"FBatchAppendQty":1,"FBatchManager":false,"FBatchSplit":0,"FBatchSplitDays":0,"FBatFixEconomy":0,"FBeforeExpire":0,"FBookPlan":false,"FCAVAcctID":{"FName":"","FNumber":""},"FCBAppendProject":{"FName":"","FNumber":""},"FCBAppendRate":0,"FCBRestore":1,"FCBRouting":{"FBillNo":"","FRoutingName":""},"FCharSourceItemID":{"FName":"","FNumber":""},"FChartNumber":null,"FCheckCycle":null,"FCheckCycUnit":{"FID":"","FName":""},"FChgFeeRate":0,"FConsumeTaxRate":0,"FContainerName":null,"FCostAcctID":{"FName":"库存现金","FNumber":"1001"},"FCostBomID":{"FBOMNumber":""},"FCostProject":{"FName":"","FNumber":""},"FCtrlStraregy":{"FID":"","FName":""},"FCtrlType":{"FID":"002","FName":"ERP"},"FCubageDecimal":4,"FCubicMeasure":{"FName":"","FNumber":""},"FDailyConsume":0,"FDaysPer":null,"FDefaultLoc":{"FName":"","FNumber":""},"FDefaultReadyLoc":{"FName":"","FNumber":""},"FDefaultRoutingID":{"FBillNo":"","FRoutingName":""},"FDefaultWorkTypeID":{"FName":"","FNumber":""},"FDSManagerID":{"FName":"","FNumber":""},"FEquipmentNum":null'
	,',"FErpClsID":{"FID":"'+IT.FID+'","FName":"'+IT.FName+'"}
		'+',"FExportRate":0,"FFirstUnit":null,"FFirstUnitRate":0,"FFixLeadTime":0,"FForbbitBarcodeEdit":false,"FFullName":"","FGoodSpec":{"FID":"","FName":""},"FGrossWeight":0,"FHeight":0,"FHelpCode":null,"FHighLimit":1000,"FHSNumber":{"FName":"","FNumber":""},"FIdentifier":{"FName":"","FNumber":""},"FImpostTaxRate":0,"FInHighLimit":0,"FInLowLimit":0,"FInspectionLevel":{"FID":"MJ","FName":"免检"},"FInspectionProject":{"FBillNo":"","FSchemeName":""},"FIsBackFlush":0,"FIsCharSourceItem":0,"FIsEquipment":false,"FIsFix":false,"FIsFixedReOrder":true,"FIsKeyItem":false,"FISKFPeriod":false,"FIsManage":false,"FIsSale":false,"FIsSNManage":false,"FIsSparePart":false,"FIsSpecialTax":false,"FItemID":0,"FKanBanCapability":1,"FKFPeriod":0,"FLastCheckDate":null,"FLeadTime":0,"FLenDecimal":2,"FLength":0,"FLowLimit":0,"FMakeFile":false,"FManageType":{"FName":"","FNumber":""},"FMaund":{"FName":"","FNumber":""},"FMCVAcctID":{"FName":"","FNumber":""}
	'+',"FModel":'+ISNULL('"'+REPLACE(I.FModel,'"','\"')+'"','null')+'
		'+',"FModelEn":null,"FMRPCon":true,"FMRPOrder":false
	'+',"FName":"'+I.FName+'"
		'+',"FNameEn":null,"FNetWeight":0,"FNote":null
	'+',"FNumber":"'+I.FNumber+'"
		'+',"FOIHighLimit":0,"FOILowLimit":0,"FOnlineShopPName":null,"FOnlineShopPNo":null,"FOrderDept":{"FName":"","FNumber":""},"FOrderInterVal":0,"FOrderPoint":0,"FOrderPrice":0,"FOrderRector":{"FName":"","FNumber":""},"FOrderTrategy":{"FID":"LFL","FName":"批对批(LFL)"}
	'+',"FOrderUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FOtherChkMde":{"FID":"MJ","FName":"免检"},"FOutMachFee":0,"FOutMachFeeProject":{"FName":"","FNumber":""},"FPCVAcctID":{"FName":"","FNumber":""},"FPickHighLimit":0,"FPickLowLimit":0,"FPieceRate":0,"FPIVAcctID":{"FName":"","FNumber":""},"FPlanMode":{"FID":"MTS","FName":"MTS计划模式"},"FPlanner":{"FName":"","FNumber":""},"FPlanPoint":1,"FPlanPrice":0,"FPlanTrategy":{"FID":"MRP","FName":"物料需求计划(MRP)"},"FPOHghPrcMnyType":{"FName":"人民币","FNumber":"RMB"},"FPOHighPrice":0,"FPOVAcctID":{"FName":"","FNumber":""},"FPriceDecimal":4,"FProChkMde":{"FID":"MJ","FName":"免检"},"FProductDesigner":{"FName":"","FNumber":""},"FProductPrincipal":{"FName":"","FNumber":""}
	'+',"FProductUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FProfitRate":0,"FPutInteger":false,"FQtyDecimal":4,"FQtyMax":10000
	'+',"FQtyMin":'+ CONVERT(VARCHAR(100),I.FQtyMin)+'
		'+',"FRequirePoint":1,"FSaleAcctID":{"FName":"库存现金","FNumber":"1001"},"FSalePrice":0
	'+',"FSaleUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FSampStdCritical":{"FName":"","FNumber":""},"FSampStdSlight":{"FName":"","FNumber":""},"FSampStdStrict":{"FName":"","FNumber":""},"FSecCoefficient":0,"FSecInv":0,"FSecondUnit":null,"FSecondUnitRate":0,"FSecUnitID":{"FName":"","FNumber":""},"FSize":0,"FSLAcctID":{"FName":"","FNumber":""},"FSOChkMde":{"FID":"MJ","FName":"免检"},"FSOHighLimit":0,"FSOLowLimit":0,"FSOLowPrc":0,"FSOLowPrcMnyType":{"FName":"人民币","FNumber":"RMB"},"FSource":{"FName":"","FNumber":""},"FSPID":{"FName":"","FNumber":""},"FSPIDReady":{"FName":"","FNumber":""},"FStandardCost":0,"FStandardManHour":0,"FStartService":false,"FStdBatchQty":1,"FStdFixFeeRate":0,"FStdPayRate":0,"FStkChkAlrm":0,"FStkChkMde":{"FID":"MJ","FName":"免检"},"FStkChkPrd":9999,"FStockTime":false
	'+',"FStoreUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FTaxRate":17,"FTotalTQQ":0,"FTrack":{"FID":"F003","FName":"先进先出法"},"FTtermOfService":0,"FTtermOfUsefulTime":0,"FTypeID":{"FID":"","FName":""}
	'+',"FUnitGroupID":{"FName":"'+MU.FName+'"}
	,"FUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FUnitPackageNumber":0,"FUseState":{"FID":"USE","FName":"使用"},"FVersion":null,"FWeightDecimal":2,"FWidth":0,"FWthDrwChkMde":{"FID":"MJ","FName":"免检"},"FWWChkMde":{"FID":"MJ","FName":"免检"},"FWWHghPrc":0,"FWWHghPrcMnyType":{"FName":"人民币","FNumber":"RMB"}}}'
	FROM Inserted I
	JOIN t_SubMessage IT ON IT.FInterID = I.FErpClsID AND IT.FTypeID = 210
	JOIN dbo.t_MeasureUnit MU ON MU.FItemID = I.FUnitID
	WHERE 1=1

	INSERT INTO TESTDB.dbo.Synchronize_DataTable
	(
		SynType,
		JsonText,
		IsFinish,
		ErrorMsg,
		DataType,
		DateInsert
	)
	SELECT  'Save',FStaticStr + FJson,0,'','Material',CONVERT(VARCHAR(22),GETDATE(),121) FROM #TEMP

	DROP TABLE #TEMP
END


--更新
--项目总成3,和焊接制品7不作同步处理
IF EXISTS(SELECT 1 FROM Inserted WHERE 1=1 AND SUBSTRING(FNumber,1,1) NOT IN ('3','7') AND EXISTS(SELECT 1 FROM Deleted))
BEGIN
	
	CREATE TABLE #TEMP2 (FStaticStr NVARCHAR(MAX), FJson NVARCHAR(MAX))

	INSERT INTO #TEMP2
	SELECT 
	'{'+'"Data": {"FNumber": "'+T2.FNumber+'",'+'"Data":{"FAcctID":{"FName":"库存现金","FNumber":"1001"},"FAdminAcctID":{"FName":"","FNumber":""},"FAlias":null,"FAPAcctID":{"FName":"","FNumber":""},"FApproveNo":null,"FAuxClassID":{"FName":"","FNumber":""},"FAuxInMrpCal":false,"FBackFlushSPID":{"FName":"","FNumber":""},"FBackFlushStockID":{"FName":"","FNumber":""},"FBatChangeEconomy":1,"FBatchAppendQty":1,"FBatchManager":false,"FBatchSplit":0,"FBatchSplitDays":0,"FBatFixEconomy":0,"FBeforeExpire":0,"FBookPlan":false,"FCAVAcctID":{"FName":"","FNumber":""},"FCBAppendProject":{"FName":"","FNumber":""},"FCBAppendRate":0,"FCBRestore":1,"FCBRouting":{"FBillNo":"","FRoutingName":""},"FCharSourceItemID":{"FName":"","FNumber":""},"FChartNumber":null,"FCheckCycle":null,"FCheckCycUnit":{"FID":"","FName":""},"FChgFeeRate":0,"FConsumeTaxRate":0,"FContainerName":null,"FCostAcctID":{"FName":"库存现金","FNumber":"1001"},"FCostBomID":{"FBOMNumber":""},"FCostProject":{"FName":"","FNumber":""},"FCtrlStraregy":{"FID":"","FName":""},"FCtrlType":{"FID":"002","FName":"ERP"},"FCubageDecimal":4,"FCubicMeasure":{"FName":"","FNumber":""},"FDailyConsume":0,"FDaysPer":null,"FDefaultLoc":{"FName":"","FNumber":""},"FDefaultReadyLoc":{"FName":"","FNumber":""},"FDefaultRoutingID":{"FBillNo":"","FRoutingName":""},"FDefaultWorkTypeID":{"FName":"","FNumber":""},"FDSManagerID":{"FName":"","FNumber":""},"FEquipmentNum":null'
	,',"FErpClsID":{"FID":"'+IT.FID+'","FName":"'+IT.FName+'"}
		'+',"FExportRate":0,"FFirstUnit":null,"FFirstUnitRate":0,"FFixLeadTime":0,"FForbbitBarcodeEdit":false,"FFullName":"","FGoodSpec":{"FID":"","FName":""},"FGrossWeight":0,"FHeight":0,"FHelpCode":null,"FHighLimit":1000,"FHSNumber":{"FName":"","FNumber":""},"FIdentifier":{"FName":"","FNumber":""},"FImpostTaxRate":0,"FInHighLimit":0,"FInLowLimit":0,"FInspectionLevel":{"FID":"MJ","FName":"免检"},"FInspectionProject":{"FBillNo":"","FSchemeName":""},"FIsBackFlush":0,"FIsCharSourceItem":0,"FIsEquipment":false,"FIsFix":false,"FIsFixedReOrder":true,"FIsKeyItem":false,"FISKFPeriod":false,"FIsManage":false,"FIsSale":false,"FIsSNManage":false,"FIsSparePart":false,"FIsSpecialTax":false,"FItemID":0,"FKanBanCapability":1,"FKFPeriod":0,"FLastCheckDate":null,"FLeadTime":0,"FLenDecimal":2,"FLength":0,"FLowLimit":0,"FMakeFile":false,"FManageType":{"FName":"","FNumber":""},"FMaund":{"FName":"","FNumber":""},"FMCVAcctID":{"FName":"","FNumber":""}
	'+',"FModel":'+ISNULL('"'+REPLACE(I.FModel,'"','\"')+'"','null')+'
		'+',"FModelEn":null,"FMRPCon":true,"FMRPOrder":false
	'+',"FName":"'+I.FName+'"
		'+',"FNameEn":null,"FNetWeight":0,"FNote":null
	'+',"FNumber":"'+I.FNumber+'"
		'+',"FOIHighLimit":0,"FOILowLimit":0,"FOnlineShopPName":null,"FOnlineShopPNo":null,"FOrderDept":{"FName":"","FNumber":""},"FOrderInterVal":0,"FOrderPoint":0,"FOrderPrice":0,"FOrderRector":{"FName":"","FNumber":""},"FOrderTrategy":{"FID":"LFL","FName":"批对批(LFL)"}
	'+',"FOrderUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FOtherChkMde":{"FID":"MJ","FName":"免检"},"FOutMachFee":0,"FOutMachFeeProject":{"FName":"","FNumber":""},"FPCVAcctID":{"FName":"","FNumber":""},"FPickHighLimit":0,"FPickLowLimit":0,"FPieceRate":0,"FPIVAcctID":{"FName":"","FNumber":""},"FPlanMode":{"FID":"MTS","FName":"MTS计划模式"},"FPlanner":{"FName":"","FNumber":""},"FPlanPoint":1,"FPlanPrice":0,"FPlanTrategy":{"FID":"MRP","FName":"物料需求计划(MRP)"},"FPOHghPrcMnyType":{"FName":"人民币","FNumber":"RMB"},"FPOHighPrice":0,"FPOVAcctID":{"FName":"","FNumber":""},"FPriceDecimal":4,"FProChkMde":{"FID":"MJ","FName":"免检"},"FProductDesigner":{"FName":"","FNumber":""},"FProductPrincipal":{"FName":"","FNumber":""}
	'+',"FProductUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FProfitRate":0,"FPutInteger":false,"FQtyDecimal":4,"FQtyMax":10000
	'+',"FQtyMin":'+ CONVERT(VARCHAR(100),I.FQtyMin)+'
		'+',"FRequirePoint":1,"FSaleAcctID":{"FName":"库存现金","FNumber":"1001"},"FSalePrice":0
	'+',"FSaleUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FSampStdCritical":{"FName":"","FNumber":""},"FSampStdSlight":{"FName":"","FNumber":""},"FSampStdStrict":{"FName":"","FNumber":""},"FSecCoefficient":0,"FSecInv":0,"FSecondUnit":null,"FSecondUnitRate":0,"FSecUnitID":{"FName":"","FNumber":""},"FSize":0,"FSLAcctID":{"FName":"","FNumber":""},"FSOChkMde":{"FID":"MJ","FName":"免检"},"FSOHighLimit":0,"FSOLowLimit":0,"FSOLowPrc":0,"FSOLowPrcMnyType":{"FName":"人民币","FNumber":"RMB"},"FSource":{"FName":"","FNumber":""},"FSPID":{"FName":"","FNumber":""},"FSPIDReady":{"FName":"","FNumber":""},"FStandardCost":0,"FStandardManHour":0,"FStartService":false,"FStdBatchQty":1,"FStdFixFeeRate":0,"FStdPayRate":0,"FStkChkAlrm":0,"FStkChkMde":{"FID":"MJ","FName":"免检"},"FStkChkPrd":9999,"FStockTime":false
	'+',"FStoreUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FTaxRate":17,"FTotalTQQ":0,"FTrack":{"FID":"F003","FName":"先进先出法"},"FTtermOfService":0,"FTtermOfUsefulTime":0,"FTypeID":{"FID":"","FName":""}
	'+',"FUnitGroupID":{"FName":"'+MU.FName+'"}
	,"FUnitID":{"FName":"'+MU.FName+'","FNumber":"'+MU.FNumber+'"}
		'+',"FUnitPackageNumber":0,"FUseState":{"FID":"USE","FName":"使用"},"FVersion":null,"FWeightDecimal":2,"FWidth":0,"FWthDrwChkMde":{"FID":"MJ","FName":"免检"},"FWWChkMde":{"FID":"MJ","FName":"免检"},"FWWHghPrc":0,"FWWHghPrcMnyType":{"FName":"人民币","FNumber":"RMB"}}}'+'}'
	FROM Inserted I
	JOIN Deleted T2 ON I.FItemID = T2.FItemID
	JOIN t_SubMessage IT ON IT.FInterID = I.FErpClsID AND IT.FTypeID = 210
	JOIN dbo.t_MeasureUnit MU ON MU.FItemID = I.FUnitID
	WHERE 1=1

	INSERT INTO TESTDB..Synchronize_DataTable
	(
		SynType,
		JsonText,
		IsFinish,
		ErrorMsg,
		DataType,
		DateInsert
	)
	SELECT  'Update',FStaticStr + FJson,0,'','Material',CONVERT(VARCHAR(22),GETDATE(),121) FROM #TEMP2

	DROP TABLE #TEMP2

END


--物料号删除
--IF EXISTS(SELECT 1 FROM Inserted WHERE 1=1 AND SUBSTRING(FNumber,1,1) NOT IN ('3','7') AND EXISTS(SELECT 1 FROM Deleted))
--BEGIN

--	--先检测其他账套是否已经使用
--	CREATE TABLE #Item_Check ( DbName VARCHAR(50) , BillType VARCHAR(50),FNumber VARCHAR(100))

--	INSERT INTO #Item_Check
--	SELECT '' DbName,'' BillType, FNUMBER FROM Deleted 

--	EXEC Check_item_isUse

--	IF EXISTS(SELECT 1 FROM #Item_Check)
--	BEGIN 
		
--		RAISERROR('物料被其他账套使用，不可以删除',18,18)
--		ROLLBACK TRAN 

--	END 
--	ELSE 
--	BEGIN
--		--同步删除物料
--		INSERT INTO TESTDB.DBO.Synchronize_DataTable (
--		SynType	
--		,JsonText	
--		,IsFinish	
--		,ErrorMsg	
--		,DataType	
--		,DateInsert 
--		)
--		select 
--		'Delete'
--		,'{"Data":{"FNumber":"'+ t1.fnumber +'"},"FDelete":"5"}'
--		,0,'','Material',CONVERT(varchar(23),GETDATE(),121)
--		from inserted t1

--	END
--END

/********物料号同步**END*****/
/*******************************************/
/*******************************************/
/*******************************************/
/*******************************************/

        IF (@@error <> 0)      
            ROLLBACK TRANSACTION      
        ELSE      
            COMMIT TRANSACTION      
        END    
    
GO


