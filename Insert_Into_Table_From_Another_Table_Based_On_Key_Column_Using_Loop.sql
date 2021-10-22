WHILE (

SELECT TOP 1 COALESCE(A.PehGenNumber, 'Zebra') AS PehGenNumber
FROM (
SELECT PehGenNumber
FROM DP_ODS.Staging.PEarHist WITH (NOLOCK)
EXCEPT
SELECT PehGenNumber
FROM DP_ODS.Staging.PEarHist_JW  WITH (NOLOCK)
) A
) <> 'Zebra'

BEGIN

INSERT INTO DP_ODS.Staging.PEarHist_JW
SELECT
p.PehAccrualCode
,CONVERT(DATETIME, p.PehAdjEarnPeriodEndDate)
,CONVERT(DATETIME, p.PehAdjEarnPeriodStartDate)
,p.PehAdjRefRecID
,CONVERT(DATETIME, p.PehAdjustedChargeDate)
,p.PehAutoAllocateOnPost
,CAST(p.PehBaseAmt AS DECIMAL(12, 2))
,p.PehBatchID
,p.PehBlockFIT
,p.PehBlockLIT
,p.PehBlockSIT
,p.PehBudgetCode
,p.PehCalcRule
,p.PehCalcSequence
,p.PehChangedByUser
,CONVERT(DATETIME, p.PehChargeDate)
,CONVERT(DATETIME, p.PehCheckInTime)
,CONVERT(DATETIME, p.PehCheckOutTime)
,p.PehClaimPdID
,p.PehCoID
,p.PehCompareToMinWages
,CAST(p.PehCurAmt AS DECIMAL(12, 2))
,CAST(p.PehCurAmtPrecise AS DECIMAL(12, 2))
,CAST(p.PehCurHrs AS DECIMAL(12, 0))
,CAST(p.PehCustomAmt1 AS DECIMAL(12, 2))
,CAST(p.PehCustomAmt2 AS DECIMAL(12, 2))
,CONVERT(DATETIME, p.PehCustomDate)
,p.PehEarnCode
,p.PehEarnTaxReportingType
,p.PehEEID
,p.PehEffectiveTipPayRate
,p.PehEmpNo
,p.PehEstCode
,p.PehExclFromFLSAMinWageDed
,p.PehExclInTotalHours
,CAST(p.PehFLSAAmtOverMinWage AS DECIMAL(12, 2))
,p.PehFLSANondBonLkbEarnCode
,p.PehFLSANondBonLkbReduceAvgHrs
,p.PehGenNumber
,p.PehGLBaseSegID
,p.PehGLFollowBaseAcctAlloc
,p.PehGrossUp
,p.PehGrossUpTarget
,p.PehGrossUpTaxCalcMethod
,CAST(p.PehHourlyPayRate AS DECIMAL(12, 2))
,p.PehInclEarnForPosition
,p.PehInclHoursForWC
,p.PehInclHrsForPosition
,p.PehInclHrsForWC
,p.PehInclInAccruals
,p.PehInclInAllocations
,p.PehInclInAvgHrsCalc
,p.PehInclInBenefitHours
,p.PehInclInDefComp
,p.PehInclInDefCompHrs
,p.pehInclInDefCompWageLimit
,p.PehInclInErnAccum
,p.PehInclInFLSAAvgPayCalc
,p.PehInclInHrsAccum
,p.PehInclInMiscEarn1
,p.PehInclInMiscEarn2
,p.PehInclInMiscEarn3
,p.PehInclInMiscEarn4
,p.PehInclInMiscEarn5
,p.PehInclInMiscEarn6
,p.PehInclInPensionAccum
,p.PehInclInRestHours
,p.PehInclInRestWages
,p.PehInclInRetroPay
,p.PehInclInRPP
,p.PehInclInRRSP
,p.PehInclInShiftDiff
,p.PehInclInTotalHoursWorked
,p.PehInclInUnionDues
,p.PehInclInUnionDuesHrs
,p.PehInclInWCEarnings
,p.PehInclOnlyRegPay
,p.PehIncludeInROE
,p.PehIsBonusNonDisc
,p.PehIsCashTip
,p.PehIsFederalContractor
,p.PehIsFLSAMakeup
,p.PehIsOvertime
,p.PehIsPieceWork
,p.PehIsProRated
,p.PehIsRegularPayCode
,p.PehIsSeparateCheck
,p.PehIsSuppWages
,p.PehIsTipWages
,p.PehIsTPSP
,p.PehIsVacationableEarning
,p.PehIsVoided
,p.PehIsVoidingRecord
,p.PehJobCode
,p.PehJobPremiumAmt
,p.PehJobPremiumRateOrPct
,p.PehLITException
,p.PehLITOccCode
,p.PehLITOtherCode
,p.PehLITResidentCode
,p.PehLITResidentCounty
,p.PehLITSDCode
,p.PehLITWccCode
,p.PehLITWorkInCode
,p.PehLITWorkInCounty
,p.PehLMWJurisdiction
,p.PehLMWJurisdictionCode
,p.PehLMWRate
,p.PehLocation
,p.PehLookbackDays
,CAST(p.PehMakeUpPayAmt AS DECIMAL(12, 2))
,CAST(p.PehNativeExemptAmt AS DECIMAL(12, 2))
,CAST(p.PehNoOfDays AS DECIMAL(12, 0))
,CAST(p.PehNoOfGames AS DECIMAL(12, 0))
,p.PehOBType
,p.PehOrgLvl1
,p.PehOrgLvl2
,p.PehOrgLvl3
,p.PehOrgLvl4
,CAST(p.PehOrigAmt AS DECIMAL(12, 2))
,CAST(p.PehOtherRate1 AS DECIMAL(12, 2))
,CAST(p.PehOtherRate2 AS DECIMAL(12, 2))
,CAST(p.PehOtherRate3 AS DECIMAL(12, 2))
,CAST(p.PehOtherRate4 AS DECIMAL(12, 2))
,CONVERT(DATETIME, p.PehPayDate)
,p.PehPayGroup
,p.PehPayoutRateType
,CAST(p.PehPayRate AS DECIMAL(12, 2))
,p.PehPaySheetID
,p.PehPeoWcClientModifier
,p.PehPerControl
,CAST(p.PehPeriodPayRate AS DECIMAL(12, 2))
,CAST(p.PehPieceCount AS DECIMAL(12, 0))
,CAST(p.PehPiecePayRate AS DECIMAL(12, 2))
,p.PehPlanYear
,p.PehPositionCode
,p.PehProject
,p.PehProrationReason
,CAST(p.PehRateFactor AS DECIMAL(12, 2))
,p.PehRateSource
,p.PehRecID
,p.PehRecordCreationSource
,p.PehRefEarnSystemID
,p.PehReportCategory
,p.PehROEOtherMoniesPaymentCode
,CONVERT(DATETIME, p.PehROEPayDate)
,CONVERT(DATETIME, p.PehROEStatutoryHolidayDate)
,p.PehSDIException
,CAST(p.PehServiceCharge AS DECIMAL(12, 2))
,p.PehShfGLExpAcct
,p.PehShfInclInDefComp
,p.PehShfInclInErnAccum
,p.PehShfInclInFLSAAvgPay
,p.PehShfInclInMiscEarn1
,p.PehShfInclInMiscEarn2
,p.PehShfInclInMiscEarn3
,p.PehShfInclInMiscEarn4
,p.PehShfInclInMiscEarn5
,p.PehShfInclInMiscEarn6
,p.PehShfInclInPensionAccum
,p.PehShfInclInRetroPay
,p.PehShfInclInRPP
,p.PehShfInclInRRSP
,p.PehShfInclInUnionDues
,CAST(p.PehShfShiftAmt AS DECIMAL(12, 2))
,p.PehShfShiftCalcRule
,p.PehShfShiftCode
,CAST(p.PehShfShiftRate AS DECIMAL(12, 2))
,p.PehSITException
,p.PehSITResidentStateCode
,p.PehSITWorkInStateCode
,p.PehStateSDI
,p.PehStateSUI
,p.PehSUIException
,p.PehSystemID
,p.PehTaxCalcGroupID
,p.PehTaxCategory
,p.PehTimeClockCode
,CAST(p.PehTipCredit AS DECIMAL(12, 2))
,CAST(p.PehTipGrossRcpts AS DECIMAL(12, 2))
,p.PehTipType
,p.PehUseDedOffSet
,p.PehUseInitialPayrate
,p.PehUseOnlyLastRegPay
,CAST(p.PehWCAllowableWages AS DECIMAL(12, 2))
,CAST(p.PehWCBilledRate AS DECIMAL(12, 2))
,p.PehWcCode
,CAST(p.PehWCCompositeRate AS DECIMAL(12, 2))
,CAST(p.PehWCEEPremium AS DECIMAL(12, 2))
,CAST(p.PehWCEERiskRate AS DECIMAL(12, 2))
,p.PehWCERPremium
,p.PehWCERRiskRate
,p.PehWCExcludedDeductions
,p.PehWCExcludedEarnings
,p.PehWCHours
,p.PehWCIncludableHours
,p.PehWCIncludableHoursCBU
,p.PehWCIncludableWages
,p.PehWCIncludedEarnings
,p.PehWcModifier
,p.PehWcProviderCode
,p.PehWCState
,CAST(p.PehYTDAmt AS DECIMAL(12, 2))
,CAST(p.PehYTDShiftAmt AS DECIMAL(12, 2))
,p.[InsertedDTM] 
,p.SHC_InsertDate
,p.SHC_UpdateDate
FROM DP_ODS.Staging.PEarHist P WITH (NOLOCK)
INNER JOIN (
SELECT TOP 5000 P.PehGenNumber
FROM (
SELECT PehGenNumber
FROM DP_ODS.Staging.PEarHist WITH (NOLOCK)
EXCEPT
SELECT PehGenNumber
FROM DP_ODS.Staging.PEarHist_JW  WITH (NOLOCK)
) P
) P1 ON P.PehGenNumber = P1.PehGenNumber
;

END





