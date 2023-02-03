// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stockSummaryModelWelcome = try? JSONDecoder().decode(StockSummaryModelWelcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - StockSummaryModelWelcome
struct StockSummaryModel: Codable, Hashable {
    let defaultKeyStatistics: StockSummaryModelDefaultKeyStatistics?
    let details: StockSummaryModelDetails?
    let summaryProfile: StockSummaryModelSummaryProfile?
    let recommendationTrend: StockSummaryModelRecommendationTrend?
    let financialsTemplate: StockSummaryModelFinancialsTemplate?
    let majorDirectHolders: StockSummaryModelHolders?
    let earnings: StockSummaryModelWelcomeEarnings?
    let price: StockSummaryModelPrice?
    let fundOwnership: StockSummaryModelOwnership?
    let insiderTransactions: StockSummaryModelInsiderTransactions?
    let insiderHolders: StockSummaryModelHolders?
    let netSharePurchaseActivity: StockSummaryModelNetSharePurchaseActivity?
    let majorHoldersBreakdown: StockSummaryModelMajorHoldersBreakdown?
    let financialData: StockSummaryModelFinancialData?
    let quoteType: StockSummaryModelQuoteType
    let institutionOwnership: StockSummaryModelOwnership?
    let calendarEvents: StockSummaryModelCalendarEvents?
    let summaryDetail: StockSummaryModelSummaryDetail
    let symbol: String?
    let esgScores: StockSummaryModelEsgScores?
    let upgradeDowngradeHistory: StockSummaryModelUpgradeDowngradeHistory?
    let pageViews: StockSummaryModelPageViews?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelCalendarEvents
struct StockSummaryModelCalendarEvents: Codable, Hashable {
    let maxAge: Int?
    let earnings: StockSummaryModelCalendarEventsEarnings?
    let exDividendDate, dividendDate: StockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelDividendDate
struct StockSummaryModelDividendDate: Codable, Hashable {
    let raw: Double?
    let fmt: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelCalendarEventsEarnings
struct StockSummaryModelCalendarEventsEarnings: Codable, Hashable {
    let earningsDate: [StockSummaryModelDividendDate]?
    let earningsAverage, earningsLow, earningsHigh: StockSummaryModelDividendDate?
    let revenueAverage, revenueLow, revenueHigh: StockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEnterpriseValue
struct StockSummaryModelEnterpriseValue: Codable, Hashable {
    let raw: Int?
    let fmt: String?
    let longFmt: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelDefaultKeyStatistics
struct StockSummaryModelDefaultKeyStatistics: Codable, Hashable {
    let annualHoldingsTurnover: StockSummaryModelDetails?
    let enterpriseToRevenue: StockSummaryModelDividendDate?
    let beta3Year: StockSummaryModelDetails?
    let profitMargins, enterpriseToEbitda, the52WeekChange: StockSummaryModelDividendDate?
    let morningStarRiskRating: StockSummaryModelDetails?
    let forwardEps: StockSummaryModelDividendDate?
    let revenueQuarterlyGrowth: StockSummaryModelDetails?
    let sharesOutstanding: StockSummaryModelEnterpriseValue?
    let fundInceptionDate, annualReportExpenseRatio, totalAssets: StockSummaryModelDetails?
    let bookValue: StockSummaryModelDividendDate?
    let sharesShort: StockSummaryModelEnterpriseValue?
    let sharesPercentSharesOut: StockSummaryModelDividendDate?
//    let fundFamily: JSONNull?
    let lastFiscalYearEnd, heldPercentInstitutions: StockSummaryModelDividendDate?
    let netIncomeToCommon: StockSummaryModelEnterpriseValue?
    let trailingEps, lastDividendValue, sandP52WeekChange, priceToBook: StockSummaryModelDividendDate?
    let heldPercentInsiders, nextFiscalYearEnd: StockSummaryModelDividendDate?
    let yield: StockSummaryModelDetails?
    let mostRecentQuarter, shortRatio, sharesShortPreviousMonthDate: StockSummaryModelDividendDate?
    let floatShares: StockSummaryModelEnterpriseValue?
    let beta: StockSummaryModelDividendDate?
    let enterpriseValue, priceHint: StockSummaryModelEnterpriseValue?
    let threeYearAverageReturn: StockSummaryModelDetails?
    let lastSplitDate: StockSummaryModelDividendDate?
    let lastSplitFactor: String?
//    let legalType: JSONNull?
    let lastDividendDate: StockSummaryModelDividendDate?
    let morningStarOverallRating: StockSummaryModelDetails?
    let earningsQuarterlyGrowth: StockSummaryModelDividendDate?
    let priceToSalesTrailing12Months: StockSummaryModelDetails?
    let dateShortInterest, pegRatio: StockSummaryModelDividendDate?
    let ytdReturn: StockSummaryModelDetails?
    let forwardPE: StockSummaryModelDividendDate?
    let maxAge: Int?
    let lastCapGain: StockSummaryModelDetails?
    let shortPercentOfFloat: StockSummaryModelDividendDate?
    let sharesShortPriorMonth, impliedSharesOutstanding: StockSummaryModelEnterpriseValue?
//    let category: JSONNull?
    let fiveYearAverageReturn: StockSummaryModelDetails?

    enum CodingKeys: String, CodingKey {
        case annualHoldingsTurnover, enterpriseToRevenue, beta3Year, profitMargins, enterpriseToEbitda
        case the52WeekChange = "52WeekChange"
        case morningStarRiskRating, forwardEps, revenueQuarterlyGrowth, sharesOutstanding, fundInceptionDate, annualReportExpenseRatio, totalAssets, bookValue, sharesShort, sharesPercentSharesOut, lastFiscalYearEnd, heldPercentInstitutions, netIncomeToCommon, trailingEps, lastDividendValue
        case sandP52WeekChange = "SandP52WeekChange"
        case priceToBook, heldPercentInsiders, nextFiscalYearEnd, yield, mostRecentQuarter, shortRatio, sharesShortPreviousMonthDate, floatShares, beta, enterpriseValue, priceHint, threeYearAverageReturn, lastSplitDate, lastSplitFactor, lastDividendDate, morningStarOverallRating, earningsQuarterlyGrowth, priceToSalesTrailing12Months, dateShortInterest, pegRatio, ytdReturn, forwardPE, maxAge, lastCapGain, shortPercentOfFloat, sharesShortPriorMonth, impliedSharesOutstanding, fiveYearAverageReturn
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelDetails
struct StockSummaryModelDetails: Codable, Hashable {
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelWelcomeEarnings
struct StockSummaryModelWelcomeEarnings: Codable, Hashable {
    let maxAge: Int?
    let earningsChart: StockSummaryModelEarningsChart?
    let financialsChart: StockSummaryModelFinancialsChart?
    let financialCurrency: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEarningsChart
struct StockSummaryModelEarningsChart: Codable, Hashable {
    let quarterly: [StockSummaryModelEarningsChartQuarterly]?
    let currentQuarterEstimate: StockSummaryModelDividendDate?
    let currentQuarterEstimateDate: String?
    let currentQuarterEstimateYear: Int?
    let earningsDate: [StockSummaryModelDividendDate]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEarningsChartQuarterly
struct StockSummaryModelEarningsChartQuarterly: Codable, Hashable {
    let date: String?
    let actual, estimate: StockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsChart
struct StockSummaryModelFinancialsChart: Codable, Hashable {
    let yearly: [StockSummaryModelYearly]?
    let quarterly: [StockSummaryModelFinancialsChartQuarterly]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsChartQuarterly
struct StockSummaryModelFinancialsChartQuarterly: Codable, Hashable {
    let date: String?
    let revenue, earnings: StockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelYearly
struct StockSummaryModelYearly: Codable, Hashable {
    let date: Int?
    let revenue, earnings: StockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEsgScores
struct StockSummaryModelEsgScores: Codable, Hashable {
    let palmOil: Bool?
    let peerSocialPerformance: StockSummaryModelPeerPerformance?
    let controversialWeapons: Bool?
    let ratingMonth: Int?
    let gambling: Bool?
    let socialScore: StockSummaryModelDividendDate?
    let nuclear, furLeather, alcoholic, gmo: Bool?
    let catholic: Bool?
//    let socialPercentile: JSONNull?
    let peerGovernancePerformance: StockSummaryModelPeerPerformance?
    let peerCount: Int?
    let relatedControversy: [String]?
    let governanceScore: StockSummaryModelDividendDate?
//    let environmentPercentile: JSONNull?
    let animalTesting: Bool?
    let peerEsgScorePerformance: StockSummaryModelPeerPerformance?
    let tobacco: Bool?
    let totalEsg: StockSummaryModelDividendDate?
    let highestControversy: Int?
    let esgPerformance: String?
    let coal: Bool?
    let peerHighestControversyPerformance: StockSummaryModelPeerPerformance?
    let pesticides, adult: Bool?
    let ratingYear, maxAge: Int?
    let percentile: StockSummaryModelDividendDate?
    let peerGroup: String?
    let smallArms: Bool?
    let peerEnvironmentPerformance: StockSummaryModelPeerPerformance?
    let environmentScore: StockSummaryModelDividendDate?
//    let governancePercentile: JSONNull?
    let militaryContract: Bool?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPeerPerformance
struct StockSummaryModelPeerPerformance: Codable, Hashable {
    let min, avg, max: Double?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialData
struct StockSummaryModelFinancialData: Codable, Hashable {
    let ebitdaMargins, profitMargins, grossMargins: StockSummaryModelDividendDate?
    let operatingCashflow: StockSummaryModelEnterpriseValue?
    let revenueGrowth, operatingMargins: StockSummaryModelDividendDate?
    let ebitda: StockSummaryModelEnterpriseValue?
    let targetLowPrice: StockSummaryModelDividendDate?
    let recommendationKey: String?
    let grossProfits, freeCashflow: StockSummaryModelEnterpriseValue?
    let targetMedianPrice, currentPrice, earningsGrowth, currentRatio: StockSummaryModelDividendDate?
    let returnOnAssets: StockSummaryModelDividendDate?
    let numberOfAnalystOpinions: StockSummaryModelEnterpriseValue?
    let targetMeanPrice, debtToEquity, returnOnEquity, targetHighPrice: StockSummaryModelDividendDate?
    let totalCash, totalDebt, totalRevenue: StockSummaryModelEnterpriseValue?
    let totalCashPerShare: StockSummaryModelDividendDate?
    let financialCurrency: String?
    let maxAge: Int?
    let revenuePerShare, quickRatio, recommendationMean: StockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsTemplate
struct StockSummaryModelFinancialsTemplate: Codable, Hashable {
    let code: String?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelOwnership
struct StockSummaryModelOwnership: Codable, Hashable {
    let maxAge: Int?
    let ownershipList: [StockSummaryModelOwnershipList]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelOwnershipList
struct StockSummaryModelOwnershipList: Codable, Hashable {
    let maxAge: Int?
    let reportDate: StockSummaryModelDividendDate?
    let organization: String?
    let pctHeld: StockSummaryModelDividendDate?
    let position, value: StockSummaryModelEnterpriseValue?
    let pctChange: StockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHolders
struct StockSummaryModelHolders: Codable, Hashable {
    let holders: [StockSummaryModelHolder]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHolder
struct StockSummaryModelHolder: Codable, Hashable {
    let maxAge: Int?
    let name: String?
    let relation: StockSummaryModelRelation?
    let url: String?
    let transactionDescription: StockSummaryModelTransactionDescription?
    let latestTransDate: StockSummaryModelDividendDate?
    let positionDirect: StockSummaryModelEnterpriseValue?
    let positionDirectDate: StockSummaryModelDividendDate?
    let positionIndirect: StockSummaryModelEnterpriseValue?
    let positionIndirectDate: StockSummaryModelDividendDate?
}

enum StockSummaryModelRelation: String, Codable, Hashable {
    case chiefExecutiveOfficer = "Chief Executive Officer"
    case chiefFinancialOfficer = "Chief Financial Officer"
    case chiefOperatingOfficer = "Chief Operating Officer"
    case director = "Director"
    case generalCounsel = "General Counsel"
    case officer = "Officer"
}

enum StockSummaryModelTransactionDescription: String, Codable, Hashable {
    case conversionOfExerciseOfDerivativeSecurity = "Conversion of Exercise of derivative security"
    case sale = "Sale"
    case stockGift = "Stock Gift"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelInsiderTransactions
struct StockSummaryModelInsiderTransactions: Codable, Hashable {
    let transactions: [StockSummaryModelTransaction]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelTransaction
struct StockSummaryModelTransaction: Codable, Hashable {
    let filerName, transactionText, moneyText: String?
    let ownership: StockSummaryModelOwnershipEnum?
    let startDate: StockSummaryModelDividendDate?
    let value: StockSummaryModelEnterpriseValue?
    let filerRelation: StockSummaryModelRelation?
    let shares: StockSummaryModelEnterpriseValue?
    let filerURL: String?
    let maxAge: Int?

    enum CodingKeys: String, CodingKey {
        case filerName, transactionText, moneyText, ownership, startDate, value, filerRelation, shares
        case filerURL = "filerUrl"
        case maxAge
    }
}

enum StockSummaryModelOwnershipEnum: String, Codable, Hashable {
    case d = "D"
    case i = "I"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelMajorHoldersBreakdown
struct StockSummaryModelMajorHoldersBreakdown: Codable, Hashable {
    let maxAge: Int?
    let insidersPercentHeld, institutionsPercentHeld, institutionsFloatPercentHeld: StockSummaryModelDividendDate?
    let institutionsCount: StockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelNetSharePurchaseActivity
struct StockSummaryModelNetSharePurchaseActivity: Codable, Hashable {
    let period: String?
    let netPercentInsiderShares: StockSummaryModelDividendDate?
    let netInfoCount, totalInsiderShares, buyInfoShares: StockSummaryModelEnterpriseValue?
    let buyPercentInsiderShares: StockSummaryModelDividendDate?
    let sellInfoCount, sellInfoShares: StockSummaryModelEnterpriseValue?
    let sellPercentInsiderShares: StockSummaryModelDividendDate?
    let maxAge: Int?
    let buyInfoCount, netInfoShares: StockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPageViews
struct StockSummaryModelPageViews: Codable, Hashable {
    let shortTermTrend, midTermTrend, longTermTrend: String?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPrice
struct StockSummaryModelPrice: Codable, Hashable {
    let quoteSourceName: String?
    let regularMarketOpen: StockSummaryModelDividendDate?
    let averageDailyVolume3Month: StockSummaryModelEnterpriseValue?
    let exchange: String?
    let regularMarketTime: Int?
    let volume24Hr: StockSummaryModelDetails?
    let regularMarketDayHigh: StockSummaryModelDividendDate?
    let shortName: String?
    let averageDailyVolume10Day: StockSummaryModelEnterpriseValue?
    let longName: String?
    let regularMarketChange: StockSummaryModelDividendDate?
    let currencySymbol: String?
    let regularMarketPreviousClose, preMarketPrice: StockSummaryModelDividendDate?
    let preMarketTime, exchangeDataDelayedBy: Int?
//    let toCurrency: JSONNull?
    let postMarketChange, postMarketPrice: StockSummaryModelDetails?
    let exchangeName: String?
    let preMarketChange: StockSummaryModelDividendDate?
    let circulatingSupply: StockSummaryModelDetails?
    let regularMarketDayLow: StockSummaryModelDividendDate?
    let priceHint: StockSummaryModelEnterpriseValue?
    let currency: String?
    let regularMarketPrice: StockSummaryModelDividendDate?
    let regularMarketVolume: StockSummaryModelEnterpriseValue?
//    let lastMarket: JSONNull?
    let regularMarketSource: String?
    let openInterest: StockSummaryModelDetails?
    let marketState: String?
//    let underlyingSymbol: JSONNull?
    let marketCap: StockSummaryModelEnterpriseValue?
    let quoteType: String?
    let preMarketChangePercent: StockSummaryModelDividendDate?
    let volumeAllCurrencies, strikePrice: StockSummaryModelDetails?
    let symbol, preMarketSource: String?
    let maxAge: Int?
//    let fromCurrency: JSONNull?
    let regularMarketChangePercent: StockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelQuoteType
struct StockSummaryModelQuoteType: Codable, Hashable {
    let exchange: String
    let shortName, longName, exchangeTimezoneName: String?
    let exchangeTimezoneShortName: String?
    let isEsgPopulated: Bool?
    let gmtOffSetMilliseconds, quoteType, symbol, messageBoardID: String?
    let market: String?

    enum CodingKeys: String, CodingKey {
        case exchange, shortName, longName, exchangeTimezoneName, exchangeTimezoneShortName, isEsgPopulated, gmtOffSetMilliseconds, quoteType, symbol
        case messageBoardID = "messageBoardId"
        case market
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelRecommendationTrend
struct StockSummaryModelRecommendationTrend: Codable, Hashable {
    let trend: [StockSummaryModelTrend]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelTrend
struct StockSummaryModelTrend: Codable, Hashable {
    let period: String?
    let strongBuy, buy, hold, sell: Int?
    let strongSell: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelSummaryDetail
struct StockSummaryModelSummaryDetail: Codable, Hashable {
    let previousClose, regularMarketOpen, twoHundredDayAverage, trailingAnnualDividendYield: StockSummaryModelDividendDate?
    let payoutRatio: StockSummaryModelDividendDate?
    let volume24Hr: StockSummaryModelDetails?
    let regularMarketDayHigh: StockSummaryModelDividendDate?
    let navPrice: StockSummaryModelDetails?
    let averageDailyVolume10Day: StockSummaryModelEnterpriseValue?
    let totalAssets: StockSummaryModelDetails?
    let regularMarketPreviousClose, fiftyDayAverage, trailingAnnualDividendRate, summaryDetailOpen: StockSummaryModelDividendDate?
//    let toCurrency: JSONNull?
    let averageVolume10Days: StockSummaryModelEnterpriseValue?
    let expireDate, yield: StockSummaryModelDetails?
//    let algorithm: JSONNull?
    let dividendRate, exDividendDate, beta: StockSummaryModelDividendDate?
    let circulatingSupply, startDate: StockSummaryModelDetails?
    let regularMarketDayLow: StockSummaryModelDividendDate?
    let priceHint: StockSummaryModelEnterpriseValue?
    let currency: String
    let trailingPE: StockSummaryModelDividendDate?
    let regularMarketVolume: StockSummaryModelEnterpriseValue?
//    let lastMarket: JSONNull?
    let maxSupply, openInterest: StockSummaryModelDetails?
    let marketCap: StockSummaryModelEnterpriseValue?
    let volumeAllCurrencies, strikePrice: StockSummaryModelDetails?
    let averageVolume: StockSummaryModelEnterpriseValue?
    let priceToSalesTrailing12Months, dayLow, ask: StockSummaryModelDividendDate?
    let ytdReturn: StockSummaryModelDetails?
    let askSize, volume: StockSummaryModelEnterpriseValue?
    let fiftyTwoWeekHigh, forwardPE: StockSummaryModelDividendDate?
    let maxAge: Int?
//    let fromCurrency: JSONNull?
    let fiveYearAvgDividendYield, fiftyTwoWeekLow, bid: StockSummaryModelDividendDate?
    let tradeable: Bool?
    let dividendYield: StockSummaryModelDividendDate?
    let bidSize: StockSummaryModelEnterpriseValue?
    let dayHigh: StockSummaryModelDividendDate?
//    let coinMarketCapLink: JSONNull?

    enum CodingKeys: String, CodingKey {
        case previousClose, regularMarketOpen, twoHundredDayAverage, trailingAnnualDividendYield, payoutRatio, volume24Hr, regularMarketDayHigh, navPrice, averageDailyVolume10Day, totalAssets, regularMarketPreviousClose, fiftyDayAverage, trailingAnnualDividendRate
        case summaryDetailOpen = "open"
        case averageVolume10Days = "averageVolume10days"
        case expireDate, yield, dividendRate, exDividendDate, beta, circulatingSupply, startDate, regularMarketDayLow, priceHint, currency, trailingPE, regularMarketVolume, maxSupply, openInterest, marketCap, volumeAllCurrencies, strikePrice, averageVolume, priceToSalesTrailing12Months, dayLow, ask, ytdReturn, askSize, volume, fiftyTwoWeekHigh, forwardPE, maxAge, fiveYearAvgDividendYield, fiftyTwoWeekLow, bid, tradeable, dividendYield, bidSize, dayHigh
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelSummaryProfile
struct StockSummaryModelSummaryProfile: Codable, Hashable {
    let zip, sector: String?
    let fullTimeEmployees: Int?
    let longBusinessSummary, city, phone, state: String?
    let country: String?
//    let companyOfficers: [JSONAny]?
    let website: String?
    let maxAge: Int?
    let address1, industry: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelUpgradeDowngradeHistory
struct StockSummaryModelUpgradeDowngradeHistory: Codable, Hashable {
    let history: [StockSummaryModelHistory]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHistory
struct StockSummaryModelHistory: Codable, Hashable {
    let epochGradeDate: Int?
    let firm: String?
    let toGrade, fromGrade: StockSummaryModelGrade?
    let action: StockSummaryModelAction?
}

enum StockSummaryModelAction: String, Codable, Hashable {
    case actionInit = "init"
    case down = "down"
    case main = "main"
    case reit = "reit"
    case up = "up"
}

enum StockSummaryModelGrade: String, Codable, Hashable {
    case accumulate = "Accumulate"
    case buy = "Buy"
    case empty = ""
    case equalWeight = "Equal-Weight"
    case gradeEqualWeight = "Equal-weight"
    case gradeLongTermBuy = "Long-term Buy"
    case hold = "Hold"
    case longTermBuy = "Long-Term Buy"
    case marketOutperform = "Market Outperform"
    case marketPerform = "Market Perform"
    case negative = "Negative"
    case neutral = "Neutral"
    case outperform = "Outperform"
    case overweight = "Overweight"
    case peerPerform = "Peer Perform"
    case perform = "Perform"
    case positive = "Positive"
    case reduce = "Reduce"
    case sectorOutperform = "Sector Outperform"
    case sectorPerform = "Sector Perform"
    case sectorWeight = "Sector Weight"
    case sell = "Sell"
    case strongBuy = "Strong Buy"
    case underperform = "Underperform"
    case underweight = "Underweight"
}
