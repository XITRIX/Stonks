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
struct ApiStockSummaryModel: Codable, Hashable {
    let defaultKeyStatistics: ApiStockSummaryModelDefaultKeyStatistics?
    let details: ApiStockSummaryModelDetails?
    let summaryProfile: ApiStockSummaryModelSummaryProfile?
    let recommendationTrend: ApiStockSummaryModelRecommendationTrend?
    let financialsTemplate: ApiStockSummaryModelFinancialsTemplate?
    let majorDirectHolders: ApiStockSummaryModelHolders?
    let earnings: ApiStockSummaryModelWelcomeEarnings?
    let price: ApiStockSummaryModelPrice?
    let fundOwnership: ApiStockSummaryModelOwnership?
    let insiderTransactions: ApiStockSummaryModelInsiderTransactions?
    let insiderHolders: ApiStockSummaryModelHolders?
    let netSharePurchaseActivity: ApiStockSummaryModelNetSharePurchaseActivity?
    let majorHoldersBreakdown: ApiStockSummaryModelMajorHoldersBreakdown?
    let financialData: ApiStockSummaryModelFinancialData?
    let quoteType: ApiStockSummaryModelQuoteType?
    let institutionOwnership: ApiStockSummaryModelOwnership?
    let calendarEvents: ApiStockSummaryModelCalendarEvents?
    let summaryDetail: ApiStockSummaryModelSummaryDetail
    let symbol: String?
    let esgScores: ApiStockSummaryModelEsgScores?
    let upgradeDowngradeHistory: ApiStockSummaryModelUpgradeDowngradeHistory?
    let pageViews: ApiStockSummaryModelPageViews?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelCalendarEvents
struct ApiStockSummaryModelCalendarEvents: Codable, Hashable {
    let maxAge: Int?
    let earnings: ApiStockSummaryModelCalendarEventsEarnings?
    let exDividendDate, dividendDate: ApiStockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelDividendDate
struct ApiStockSummaryModelDividendDate: Codable, Hashable {
    let raw: Double?
    let fmt: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelCalendarEventsEarnings
struct ApiStockSummaryModelCalendarEventsEarnings: Codable, Hashable {
    let earningsDate: [ApiStockSummaryModelDividendDate]?
    let earningsAverage, earningsLow, earningsHigh: ApiStockSummaryModelDividendDate?
    let revenueAverage, revenueLow, revenueHigh: ApiStockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEnterpriseValue
struct ApiStockSummaryModelEnterpriseValue: Codable, Hashable {
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
struct ApiStockSummaryModelDefaultKeyStatistics: Codable, Hashable {
    let annualHoldingsTurnover: ApiStockSummaryModelDetails?
    let enterpriseToRevenue: ApiStockSummaryModelDividendDate?
    let beta3Year: ApiStockSummaryModelDetails?
    let profitMargins, enterpriseToEbitda, the52WeekChange: ApiStockSummaryModelDividendDate?
    let morningStarRiskRating: ApiStockSummaryModelDetails?
    let forwardEps: ApiStockSummaryModelDividendDate?
    let revenueQuarterlyGrowth: ApiStockSummaryModelDetails?
    let sharesOutstanding: ApiStockSummaryModelEnterpriseValue?
    let fundInceptionDate, annualReportExpenseRatio, totalAssets: ApiStockSummaryModelDetails?
    let bookValue: ApiStockSummaryModelDividendDate?
    let sharesShort: ApiStockSummaryModelEnterpriseValue?
    let sharesPercentSharesOut: ApiStockSummaryModelDividendDate?
//    let fundFamily: JSONNull?
    let lastFiscalYearEnd, heldPercentInstitutions: ApiStockSummaryModelDividendDate?
    let netIncomeToCommon: ApiStockSummaryModelEnterpriseValue?
    let trailingEps, lastDividendValue, sandP52WeekChange, priceToBook: ApiStockSummaryModelDividendDate?
    let heldPercentInsiders, nextFiscalYearEnd: ApiStockSummaryModelDividendDate?
    let yield: ApiStockSummaryModelDetails?
    let mostRecentQuarter, shortRatio, sharesShortPreviousMonthDate: ApiStockSummaryModelDividendDate?
    let floatShares: ApiStockSummaryModelEnterpriseValue?
    let beta: ApiStockSummaryModelDividendDate?
    let enterpriseValue, priceHint: ApiStockSummaryModelEnterpriseValue?
    let threeYearAverageReturn: ApiStockSummaryModelDetails?
    let lastSplitDate: ApiStockSummaryModelDividendDate?
    let lastSplitFactor: String?
//    let legalType: JSONNull?
    let lastDividendDate: ApiStockSummaryModelDividendDate?
    let morningStarOverallRating: ApiStockSummaryModelDetails?
    let earningsQuarterlyGrowth: ApiStockSummaryModelDividendDate?
    let priceToSalesTrailing12Months: ApiStockSummaryModelDetails?
    let dateShortInterest, pegRatio: ApiStockSummaryModelDividendDate?
    let ytdReturn: ApiStockSummaryModelDetails?
    let forwardPE: ApiStockSummaryModelDividendDate?
    let maxAge: Int?
    let lastCapGain: ApiStockSummaryModelDetails?
    let shortPercentOfFloat: ApiStockSummaryModelDividendDate?
    let sharesShortPriorMonth, impliedSharesOutstanding: ApiStockSummaryModelEnterpriseValue?
//    let category: JSONNull?
    let fiveYearAverageReturn: ApiStockSummaryModelDetails?

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
struct ApiStockSummaryModelDetails: Codable, Hashable {
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelWelcomeEarnings
struct ApiStockSummaryModelWelcomeEarnings: Codable, Hashable {
    let maxAge: Int?
    let earningsChart: ApiStockSummaryModelEarningsChart?
    let financialsChart: ApiStockSummaryModelFinancialsChart?
    let financialCurrency: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEarningsChart
struct ApiStockSummaryModelEarningsChart: Codable, Hashable {
    let quarterly: [ApiStockSummaryModelEarningsChartQuarterly]?
    let currentQuarterEstimate: ApiStockSummaryModelDividendDate?
    let currentQuarterEstimateDate: String?
    let currentQuarterEstimateYear: Int?
    let earningsDate: [ApiStockSummaryModelDividendDate]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEarningsChartQuarterly
struct ApiStockSummaryModelEarningsChartQuarterly: Codable, Hashable {
    let date: String?
    let actual, estimate: ApiStockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsChart
struct ApiStockSummaryModelFinancialsChart: Codable, Hashable {
    let yearly: [ApiStockSummaryModelYearly]?
    let quarterly: [ApiStockSummaryModelFinancialsChartQuarterly]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsChartQuarterly
struct ApiStockSummaryModelFinancialsChartQuarterly: Codable, Hashable {
    let date: String?
    let revenue, earnings: ApiStockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelYearly
struct ApiStockSummaryModelYearly: Codable, Hashable {
    let date: Int?
    let revenue, earnings: ApiStockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelEsgScores
struct ApiStockSummaryModelEsgScores: Codable, Hashable {
    let palmOil: Bool?
    let peerSocialPerformance: ApiStockSummaryModelPeerPerformance?
    let controversialWeapons: Bool?
    let ratingMonth: Int?
    let gambling: Bool?
    let socialScore: ApiStockSummaryModelDividendDate?
    let nuclear, furLeather, alcoholic, gmo: Bool?
    let catholic: Bool?
//    let socialPercentile: JSONNull?
    let peerGovernancePerformance: ApiStockSummaryModelPeerPerformance?
    let peerCount: Int?
    let relatedControversy: [String]?
    let governanceScore: ApiStockSummaryModelDividendDate?
//    let environmentPercentile: JSONNull?
    let animalTesting: Bool?
    let peerEsgScorePerformance: ApiStockSummaryModelPeerPerformance?
    let tobacco: Bool?
    let totalEsg: ApiStockSummaryModelDividendDate?
    let highestControversy: Int?
    let esgPerformance: String?
    let coal: Bool?
    let peerHighestControversyPerformance: ApiStockSummaryModelPeerPerformance?
    let pesticides, adult: Bool?
    let ratingYear, maxAge: Int?
    let percentile: ApiStockSummaryModelDividendDate?
    let peerGroup: String?
    let smallArms: Bool?
    let peerEnvironmentPerformance: ApiStockSummaryModelPeerPerformance?
    let environmentScore: ApiStockSummaryModelDividendDate?
//    let governancePercentile: JSONNull?
    let militaryContract: Bool?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPeerPerformance
struct ApiStockSummaryModelPeerPerformance: Codable, Hashable {
    let min, avg, max: Double?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialData
struct ApiStockSummaryModelFinancialData: Codable, Hashable {
    let ebitdaMargins, profitMargins, grossMargins: ApiStockSummaryModelDividendDate?
    let operatingCashflow: ApiStockSummaryModelEnterpriseValue?
    let revenueGrowth, operatingMargins: ApiStockSummaryModelDividendDate?
    let ebitda: ApiStockSummaryModelEnterpriseValue?
    let targetLowPrice: ApiStockSummaryModelDividendDate?
    let recommendationKey: String?
    let grossProfits, freeCashflow: ApiStockSummaryModelEnterpriseValue?
    let targetMedianPrice, currentPrice, earningsGrowth, currentRatio: ApiStockSummaryModelDividendDate?
    let returnOnAssets: ApiStockSummaryModelDividendDate?
    let numberOfAnalystOpinions: ApiStockSummaryModelEnterpriseValue?
    let targetMeanPrice, debtToEquity, returnOnEquity, targetHighPrice: ApiStockSummaryModelDividendDate?
    let totalCash, totalDebt, totalRevenue: ApiStockSummaryModelEnterpriseValue?
    let totalCashPerShare: ApiStockSummaryModelDividendDate?
    let financialCurrency: String?
    let maxAge: Int?
    let revenuePerShare, quickRatio, recommendationMean: ApiStockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelFinancialsTemplate
struct ApiStockSummaryModelFinancialsTemplate: Codable, Hashable {
    let code: String?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelOwnership
struct ApiStockSummaryModelOwnership: Codable, Hashable {
    let maxAge: Int?
    let ownershipList: [ApiStockSummaryModelOwnershipList]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelOwnershipList
struct ApiStockSummaryModelOwnershipList: Codable, Hashable {
    let maxAge: Int?
    let reportDate: ApiStockSummaryModelDividendDate?
    let organization: String?
    let pctHeld: ApiStockSummaryModelDividendDate?
    let position, value: ApiStockSummaryModelEnterpriseValue?
    let pctChange: ApiStockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHolders
struct ApiStockSummaryModelHolders: Codable, Hashable {
    let holders: [ApiStockSummaryModelHolder]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHolder
struct ApiStockSummaryModelHolder: Codable, Hashable {
    let maxAge: Int?
    let name: String?
    let relation: ApiStockSummaryModelRelation?
    let url: String?
    let transactionDescription: ApiStockSummaryModelTransactionDescription?
    let latestTransDate: ApiStockSummaryModelDividendDate?
    let positionDirect: ApiStockSummaryModelEnterpriseValue?
    let positionDirectDate: ApiStockSummaryModelDividendDate?
    let positionIndirect: ApiStockSummaryModelEnterpriseValue?
    let positionIndirectDate: ApiStockSummaryModelDividendDate?
}

enum ApiStockSummaryModelRelation: String, Codable, Hashable {
    case chiefExecutiveOfficer = "Chief Executive Officer"
    case chiefFinancialOfficer = "Chief Financial Officer"
    case chiefOperatingOfficer = "Chief Operating Officer"
    case director = "Director"
    case generalCounsel = "General Counsel"
    case officer = "Officer"
}

enum ApiStockSummaryModelTransactionDescription: String, Codable, Hashable {
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
struct ApiStockSummaryModelInsiderTransactions: Codable, Hashable {
    let transactions: [ApiStockSummaryModelTransaction]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelTransaction
struct ApiStockSummaryModelTransaction: Codable, Hashable {
    let filerName, transactionText, moneyText: String?
    let ownership: ApiStockSummaryModelOwnershipEnum?
    let startDate: ApiStockSummaryModelDividendDate?
    let value: ApiStockSummaryModelEnterpriseValue?
    let filerRelation: ApiStockSummaryModelRelation?
    let shares: ApiStockSummaryModelEnterpriseValue?
    let filerURL: String?
    let maxAge: Int?

    enum CodingKeys: String, CodingKey {
        case filerName, transactionText, moneyText, ownership, startDate, value, filerRelation, shares
        case filerURL = "filerUrl"
        case maxAge
    }
}

enum ApiStockSummaryModelOwnershipEnum: String, Codable, Hashable {
    case d = "D"
    case i = "I"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelMajorHoldersBreakdown
struct ApiStockSummaryModelMajorHoldersBreakdown: Codable, Hashable {
    let maxAge: Int?
    let insidersPercentHeld, institutionsPercentHeld, institutionsFloatPercentHeld: ApiStockSummaryModelDividendDate?
    let institutionsCount: ApiStockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelNetSharePurchaseActivity
struct ApiStockSummaryModelNetSharePurchaseActivity: Codable, Hashable {
    let period: String?
    let netPercentInsiderShares: ApiStockSummaryModelDividendDate?
    let netInfoCount, totalInsiderShares, buyInfoShares: ApiStockSummaryModelEnterpriseValue?
    let buyPercentInsiderShares: ApiStockSummaryModelDividendDate?
    let sellInfoCount, sellInfoShares: ApiStockSummaryModelEnterpriseValue?
    let sellPercentInsiderShares: ApiStockSummaryModelDividendDate?
    let maxAge: Int?
    let buyInfoCount, netInfoShares: ApiStockSummaryModelEnterpriseValue?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPageViews
struct ApiStockSummaryModelPageViews: Codable, Hashable {
    let shortTermTrend, midTermTrend, longTermTrend: String?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelPrice
struct ApiStockSummaryModelPrice: Codable, Hashable {
    let quoteSourceName: String?
    let regularMarketOpen: ApiStockSummaryModelDividendDate?
    let averageDailyVolume3Month: ApiStockSummaryModelEnterpriseValue?
    let exchange: String?
    let regularMarketTime: Int?
    let volume24Hr: ApiStockSummaryModelDetails?
    let regularMarketDayHigh: ApiStockSummaryModelDividendDate?
    let shortName: String?
    let averageDailyVolume10Day: ApiStockSummaryModelEnterpriseValue?
    let longName: String?
    let regularMarketChange: ApiStockSummaryModelDividendDate?
    let currencySymbol: String?
    let regularMarketPreviousClose, preMarketPrice: ApiStockSummaryModelDividendDate?
    let preMarketTime, exchangeDataDelayedBy: Int?
//    let toCurrency: JSONNull?
    let postMarketChange, postMarketPrice: ApiStockSummaryModelDetails?
    let exchangeName: String?
    let preMarketChange: ApiStockSummaryModelDividendDate?
    let circulatingSupply: ApiStockSummaryModelDetails?
    let regularMarketDayLow: ApiStockSummaryModelDividendDate?
    let priceHint: ApiStockSummaryModelEnterpriseValue?
    let currency: String?
    let regularMarketPrice: ApiStockSummaryModelDividendDate?
    let regularMarketVolume: ApiStockSummaryModelEnterpriseValue?
//    let lastMarket: JSONNull?
    let regularMarketSource: String?
    let openInterest: ApiStockSummaryModelDetails?
    let marketState: String?
//    let underlyingSymbol: JSONNull?
    let marketCap: ApiStockSummaryModelEnterpriseValue?
    let quoteType: String?
    let preMarketChangePercent: ApiStockSummaryModelDividendDate?
    let volumeAllCurrencies, strikePrice: ApiStockSummaryModelDetails?
    let symbol, preMarketSource: String?
    let maxAge: Int?
//    let fromCurrency: JSONNull?
    let regularMarketChangePercent: ApiStockSummaryModelDividendDate?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelQuoteType
struct ApiStockSummaryModelQuoteType: Codable, Hashable {
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
struct ApiStockSummaryModelRecommendationTrend: Codable, Hashable {
    let trend: [ApiStockSummaryModelTrend]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelTrend
struct ApiStockSummaryModelTrend: Codable, Hashable {
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
struct ApiStockSummaryModelSummaryDetail: Codable, Hashable {
    let previousClose, regularMarketOpen, twoHundredDayAverage, trailingAnnualDividendYield: ApiStockSummaryModelDividendDate?
    let payoutRatio: ApiStockSummaryModelDividendDate?
    let volume24Hr: ApiStockSummaryModelDetails?
    let regularMarketDayHigh: ApiStockSummaryModelDividendDate?
    let navPrice: ApiStockSummaryModelDetails?
    let averageDailyVolume10Day: ApiStockSummaryModelEnterpriseValue?
    let totalAssets: ApiStockSummaryModelDetails?
    let regularMarketPreviousClose, fiftyDayAverage, trailingAnnualDividendRate, summaryDetailOpen: ApiStockSummaryModelDividendDate?
//    let toCurrency: JSONNull?
    let averageVolume10Days: ApiStockSummaryModelEnterpriseValue?
    let expireDate, yield: ApiStockSummaryModelDetails?
//    let algorithm: JSONNull?
    let dividendRate, exDividendDate, beta: ApiStockSummaryModelDividendDate?
    let circulatingSupply, startDate: ApiStockSummaryModelDetails?
    let regularMarketDayLow: ApiStockSummaryModelDividendDate?
    let priceHint: ApiStockSummaryModelEnterpriseValue?
    let currency: String
    let trailingPE: ApiStockSummaryModelDividendDate?
    let regularMarketVolume: ApiStockSummaryModelEnterpriseValue?
//    let lastMarket: JSONNull?
    let maxSupply, openInterest: ApiStockSummaryModelDetails?
    let marketCap: ApiStockSummaryModelEnterpriseValue?
    let volumeAllCurrencies, strikePrice: ApiStockSummaryModelDetails?
    let averageVolume: ApiStockSummaryModelEnterpriseValue?
    let priceToSalesTrailing12Months, dayLow, ask: ApiStockSummaryModelDividendDate?
    let ytdReturn: ApiStockSummaryModelDetails?
    let askSize, volume: ApiStockSummaryModelEnterpriseValue?
    let fiftyTwoWeekHigh, forwardPE: ApiStockSummaryModelDividendDate?
    let maxAge: Int?
//    let fromCurrency: JSONNull?
    let fiveYearAvgDividendYield, fiftyTwoWeekLow, bid: ApiStockSummaryModelDividendDate?
    let tradeable: Bool?
    let dividendYield: ApiStockSummaryModelDividendDate?
    let bidSize: ApiStockSummaryModelEnterpriseValue?
    let dayHigh: ApiStockSummaryModelDividendDate?
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
struct ApiStockSummaryModelSummaryProfile: Codable, Hashable {
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
struct ApiStockSummaryModelUpgradeDowngradeHistory: Codable, Hashable {
    let history: [ApiStockSummaryModelHistory]?
    let maxAge: Int?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StockSummaryModelHistory
struct ApiStockSummaryModelHistory: Codable, Hashable {
    let epochGradeDate: Int?
    let firm: String?
    let toGrade, fromGrade: ApiStockSummaryModelGrade?
    let action: ApiStockSummaryModelAction?
}

enum ApiStockSummaryModelAction: String, Codable, Hashable {
    case actionInit = "init"
    case down = "down"
    case main = "main"
    case reit = "reit"
    case up = "up"
}

enum ApiStockSummaryModelGrade: String, Codable, Hashable {
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
