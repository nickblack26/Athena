import Foundation
import Supabase

public enum PublicSchema {
    public enum AuthType: String, Codable, Hashable, Sendable {
        case oauth2 = "OAuth2"
        case basic = "Basic"
    }
    public enum IntegrationType: String, Codable, Hashable, Sendable {
        case reseller = "reseller"
        case distribution = "distribution"
        case email = "email"
    }
    public enum Status: String, Codable, Hashable, Sendable {
        case building = "building"
        case inprogress = "inProgress"
        case signed = "signed"
        case canceled = "canceled"
    }
    public struct IntegrationsSelect: Codable, Hashable, Sendable {
        public let authType: AuthType? = nil
        public let id: UUID
        public let logo: String? = nil
        public let name: String
        public let type: IntegrationType? = nil
        public enum CodingKeys: String, CodingKey {
            case authType = "auth_type"
            case id = "id"
            case logo = "logo"
            case name = "name"
            case type = "type"
        }
    }
    public struct IntegrationsInsert: Codable, Hashable, Sendable {
        public let authType: AuthType? = nil
        public let id: UUID? = nil
        public let logo: String? = nil
        public let name: String
        public let type: IntegrationType? = nil
        public enum CodingKeys: String, CodingKey {
            case authType = "auth_type"
            case id = "id"
            case logo = "logo"
            case name = "name"
            case type = "type"
        }
    }
    public struct IntegrationsUpdate: Codable, Hashable, Sendable {
        public let authType: AuthType? = nil
        public let id: UUID? = nil
        public let logo: String? = nil
        public let name: String? = nil
        public let type: IntegrationType? = nil
        public enum CodingKeys: String, CodingKey {
            case authType = "auth_type"
            case id = "id"
            case logo = "logo"
            case name = "name"
            case type = "type"
        }
    }
    public struct OrganizationIntegrationsSelect: Codable, Hashable, Sendable {
        public let clientId: String? = nil
        public let integration: UUID
        public let organization: UUID
        public let secretKey: String? = nil
        public enum CodingKeys: String, CodingKey {
            case clientId = "client_id"
            case integration = "integration"
            case organization = "organization"
            case secretKey = "secret_key"
        }
    }
    public struct OrganizationIntegrationsInsert: Codable, Hashable, Sendable {
        public let clientId: String? = nil
        public let integration: UUID
        public let organization: UUID
        public let secretKey: String? = nil
        public enum CodingKeys: String, CodingKey {
            case clientId = "client_id"
            case integration = "integration"
            case organization = "organization"
            case secretKey = "secret_key"
        }
    }
    public struct OrganizationIntegrationsUpdate: Codable, Hashable, Sendable {
        public let clientId: String? = nil
        public let integration: UUID? = nil
        public let organization: UUID? = nil
        public let secretKey: String? = nil
        public enum CodingKeys: String, CodingKey {
            case clientId = "client_id"
            case integration = "integration"
            case organization = "organization"
            case secretKey = "secret_key"
        }
    }
    public struct OrganizationsSelect: Codable, Hashable, Sendable {
        public let defaultAssumptions: String? = nil
        public let defaultTemplate: Int? = nil
        public let id: UUID
        public let laborRate: Double
        public let name: String
        public let slug: String? = nil
        public let visibilitySettings: AnyJSON
        public enum CodingKeys: String, CodingKey {
            case defaultAssumptions = "default_assumptions"
            case defaultTemplate = "default_template"
            case id = "id"
            case laborRate = "labor_rate"
            case name = "name"
            case slug = "slug"
            case visibilitySettings = "visibility_settings"
        }
    }
    public struct OrganizationsInsert: Codable, Hashable, Sendable {
        public let defaultAssumptions: String? = nil
        public let defaultTemplate: Int? = nil
        public let id: UUID? = nil
        public let laborRate: Double
        public let name: String
        public let slug: String? = nil
        public let visibilitySettings: AnyJSON? = nil
        public enum CodingKeys: String, CodingKey {
            case defaultAssumptions = "default_assumptions"
            case defaultTemplate = "default_template"
            case id = "id"
            case laborRate = "labor_rate"
            case name = "name"
            case slug = "slug"
            case visibilitySettings = "visibility_settings"
        }
    }
    public struct OrganizationsUpdate: Codable, Hashable, Sendable {
        public let defaultAssumptions: String? = nil
        public let defaultTemplate: Int? = nil
        public let id: UUID? = nil
        public let laborRate: Double? = nil
        public let name: String? = nil
        public let slug: String? = nil
        public let visibilitySettings: AnyJSON? = nil
        public enum CodingKeys: String, CodingKey {
            case defaultAssumptions = "default_assumptions"
            case defaultTemplate = "default_template"
            case id = "id"
            case laborRate = "labor_rate"
            case name = "name"
            case slug = "slug"
            case visibilitySettings = "visibility_settings"
        }
    }
    public struct PhasesSelect: Codable, Hashable, Sendable {
        public let description: String
        public let hours: Double
        public let id: UUID
        public var order: Double
        public let referenceId: Int? = nil
        public let version: UUID
        public let visible: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case description = "description"
            case hours = "hours"
            case id = "id"
            case order = "order"
            case referenceId = "reference_id"
            case version = "version"
            case visible = "visible"
        }
    }
    public struct PhasesInsert: Codable, Hashable, Sendable {
        public let description: String
        public let hours: Double? = nil
        public let id: UUID? = nil
        public let order: Double? = nil
        public let referenceId: Int? = nil
        public let version: UUID
        public let visible: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case description = "description"
            case hours = "hours"
            case id = "id"
            case order = "order"
            case referenceId = "reference_id"
            case version = "version"
            case visible = "visible"
        }
    }
    public struct PhasesUpdate: Codable, Hashable, Sendable {
        public let description: String? = nil
        public let hours: Double? = nil
        public let id: UUID? = nil
        public let order: Double? = nil
        public let referenceId: Int? = nil
        public let version: UUID? = nil
        public let visible: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case description = "description"
            case hours = "hours"
            case id = "id"
            case order = "order"
            case referenceId = "reference_id"
            case version = "version"
            case visible = "visible"
        }
    }
    public struct ProductsSelect: Codable, Hashable, Sendable {
        public let additionalOverrides: AnyJSON? = nil
        public let calculatedCost: Double? = nil
        public let calculatedPrice: Double? = nil
        public let catalogItem: Int? = nil
        public let category: String? = nil
        public let cost: Double? = nil
        public let createdAt: String? = nil
        public let description: String? = nil
        public let extendedCost: Double? = nil
        public let extendedPrice: Double? = nil
        public let id: Int? = nil
        public let identifier: String? = nil
        public let manufacturerPartNumber: String? = nil
        public let order: Int
        public let parent: UUID? = nil
        public let parentCatalogItem: Int? = nil
        public let price: Double? = nil
        public let productClass: String? = nil
        public let quantity: Double
        public let recurringBillCycle: Int? = nil
        public let recurringCost: Double? = nil
        public let recurringCycleType: String? = nil
        public let recurringFlag: Bool? = nil
        public let section: UUID? = nil
        public let sequenceNumber: Int? = nil
        public let taxableFlag: Bool? = nil
        public let type: String? = nil
        public let uniqueId: UUID
        public let unitOfMeasure: String? = nil
        public let vendor: String? = nil
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case additionalOverrides = "additional_overrides"
            case calculatedCost = "calculated_cost"
            case calculatedPrice = "calculated_price"
            case catalogItem = "catalog_item"
            case category = "category"
            case cost = "cost"
            case createdAt = "created_at"
            case description = "description"
            case extendedCost = "extended_cost"
            case extendedPrice = "extended_price"
            case id = "id"
            case identifier = "identifier"
            case manufacturerPartNumber = "manufacturer_part_number"
            case order = "order"
            case parent = "parent"
            case parentCatalogItem = "parent_catalog_item"
            case price = "price"
            case productClass = "product_class"
            case quantity = "quantity"
            case recurringBillCycle = "recurring_bill_cycle"
            case recurringCost = "recurring_cost"
            case recurringCycleType = "recurring_cycle_type"
            case recurringFlag = "recurring_flag"
            case section = "section"
            case sequenceNumber = "sequence_number"
            case taxableFlag = "taxable_flag"
            case type = "type"
            case uniqueId = "unique_id"
            case unitOfMeasure = "unit_of_measure"
            case vendor = "vendor"
            case version = "version"
        }
    }
    public struct ProductsInsert: Codable, Hashable, Sendable {
        public let additionalOverrides: AnyJSON? = nil
        public let calculatedCost: Double? = nil
        public let calculatedPrice: Double? = nil
        public let catalogItem: Int? = nil
        public let category: String? = nil
        public let cost: Double? = nil
        public let createdAt: String? = nil
        public let description: String? = nil
        public let extendedCost: Double? = nil
        public let extendedPrice: Double? = nil
        public let id: Int? = nil
        public let identifier: String? = nil
        public let manufacturerPartNumber: String? = nil
        public let order: Int? = nil
        public let parent: UUID? = nil
        public let parentCatalogItem: Int? = nil
        public let price: Double? = nil
        public let productClass: String? = nil
        public let quantity: Double? = nil
        public let recurringBillCycle: Int? = nil
        public let recurringCost: Double? = nil
        public let recurringCycleType: String? = nil
        public let recurringFlag: Bool? = nil
        public let section: UUID? = nil
        public let sequenceNumber: Int? = nil
        public let taxableFlag: Bool? = nil
        public let type: String? = nil
        public let uniqueId: UUID? = nil
        public let unitOfMeasure: String? = nil
        public let vendor: String? = nil
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case additionalOverrides = "additional_overrides"
            case calculatedCost = "calculated_cost"
            case calculatedPrice = "calculated_price"
            case catalogItem = "catalog_item"
            case category = "category"
            case cost = "cost"
            case createdAt = "created_at"
            case description = "description"
            case extendedCost = "extended_cost"
            case extendedPrice = "extended_price"
            case id = "id"
            case identifier = "identifier"
            case manufacturerPartNumber = "manufacturer_part_number"
            case order = "order"
            case parent = "parent"
            case parentCatalogItem = "parent_catalog_item"
            case price = "price"
            case productClass = "product_class"
            case quantity = "quantity"
            case recurringBillCycle = "recurring_bill_cycle"
            case recurringCost = "recurring_cost"
            case recurringCycleType = "recurring_cycle_type"
            case recurringFlag = "recurring_flag"
            case section = "section"
            case sequenceNumber = "sequence_number"
            case taxableFlag = "taxable_flag"
            case type = "type"
            case uniqueId = "unique_id"
            case unitOfMeasure = "unit_of_measure"
            case vendor = "vendor"
            case version = "version"
        }
    }
    public struct ProductsUpdate: Codable, Hashable, Sendable {
        public let additionalOverrides: AnyJSON? = nil
        public let calculatedCost: Double? = nil
        public let calculatedPrice: Double? = nil
        public let catalogItem: Int? = nil
        public let category: String? = nil
        public let cost: Double? = nil
        public let createdAt: String? = nil
        public let description: String? = nil
        public let extendedCost: Double? = nil
        public let extendedPrice: Double? = nil
        public let id: Int? = nil
        public let identifier: String? = nil
        public let manufacturerPartNumber: String? = nil
        public let order: Int? = nil
        public let parent: UUID? = nil
        public let parentCatalogItem: Int? = nil
        public let price: Double? = nil
        public let productClass: String? = nil
        public let quantity: Double? = nil
        public let recurringBillCycle: Int? = nil
        public let recurringCost: Double? = nil
        public let recurringCycleType: String? = nil
        public let recurringFlag: Bool? = nil
        public let section: UUID? = nil
        public let sequenceNumber: Int? = nil
        public let taxableFlag: Bool? = nil
        public let type: String? = nil
        public let uniqueId: UUID? = nil
        public let unitOfMeasure: String? = nil
        public let vendor: String? = nil
        public let version: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case additionalOverrides = "additional_overrides"
            case calculatedCost = "calculated_cost"
            case calculatedPrice = "calculated_price"
            case catalogItem = "catalog_item"
            case category = "category"
            case cost = "cost"
            case createdAt = "created_at"
            case description = "description"
            case extendedCost = "extended_cost"
            case extendedPrice = "extended_price"
            case id = "id"
            case identifier = "identifier"
            case manufacturerPartNumber = "manufacturer_part_number"
            case order = "order"
            case parent = "parent"
            case parentCatalogItem = "parent_catalog_item"
            case price = "price"
            case productClass = "product_class"
            case quantity = "quantity"
            case recurringBillCycle = "recurring_bill_cycle"
            case recurringCost = "recurring_cost"
            case recurringCycleType = "recurring_cycle_type"
            case recurringFlag = "recurring_flag"
            case section = "section"
            case sequenceNumber = "sequence_number"
            case taxableFlag = "taxable_flag"
            case type = "type"
            case uniqueId = "unique_id"
            case unitOfMeasure = "unit_of_measure"
            case vendor = "vendor"
            case version = "version"
        }
    }
    public struct ProfilesSelect: Codable, Hashable, Sendable {
        public let avatarUrl: String? = nil
        public let firstName: String? = nil
        public let id: UUID
        public let lastName: String? = nil
        public let manageReferenceId: Int? = nil
        public let organization: UUID? = nil
        public let updatedAt: String? = nil
        public let username: String? = nil
        public enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
            case firstName = "first_name"
            case id = "id"
            case lastName = "last_name"
            case manageReferenceId = "manage_reference_id"
            case organization = "organization"
            case updatedAt = "updated_at"
            case username = "username"
        }
    }
    public struct ProfilesInsert: Codable, Hashable, Sendable {
        public let avatarUrl: String? = nil
        public let firstName: String? = nil
        public let id: UUID
        public let lastName: String? = nil
        public let manageReferenceId: Int? = nil
        public let organization: UUID? = nil
        public let updatedAt: String? = nil
        public let username: String? = nil
        public enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
            case firstName = "first_name"
            case id = "id"
            case lastName = "last_name"
            case manageReferenceId = "manage_reference_id"
            case organization = "organization"
            case updatedAt = "updated_at"
            case username = "username"
        }
    }
    public struct ProfilesUpdate: Codable, Hashable, Sendable {
        public let avatarUrl: String? = nil
        public let firstName: String? = nil
        public let id: UUID? = nil
        public let lastName: String? = nil
        public let manageReferenceId: Int? = nil
        public let organization: UUID? = nil
        public let updatedAt: String? = nil
        public let username: String? = nil
        public enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
            case firstName = "first_name"
            case id = "id"
            case lastName = "last_name"
            case manageReferenceId = "manage_reference_id"
            case organization = "organization"
            case updatedAt = "updated_at"
            case username = "username"
        }
    }
    public struct ProposalSettingsSelect: Codable, Hashable, Sendable {
        public let assumptions: String
        public let description: String? = nil
        public let proposal: UUID
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case assumptions = "assumptions"
            case description = "description"
            case proposal = "proposal"
            case version = "version"
        }
    }
    public struct ProposalSettingsInsert: Codable, Hashable, Sendable {
        public let assumptions: String
        public let description: String? = nil
        public let proposal: UUID
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case assumptions = "assumptions"
            case description = "description"
            case proposal = "proposal"
            case version = "version"
        }
    }
    public struct ProposalSettingsUpdate: Codable, Hashable, Sendable {
        public let assumptions: String? = nil
        public let description: String? = nil
        public let proposal: UUID? = nil
        public let version: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case assumptions = "assumptions"
            case description = "description"
            case proposal = "proposal"
            case version = "version"
        }
    }
    public struct ProposalsSelect: Codable, Hashable, Sendable {
        public let approvalInfo: AnyJSON?
        public let assumptions: String?
        public let catalogItems: [Int]?
        public let companyId: Int?
        public let companyName: String?
        public let contactId: Int?
        public let createdAt: String
        public let createdBy: UUID?
        public let expirationDate: String?
        public let id: UUID
        public let laborHours: Double
        public let laborRate: Double
        public let name: String
        public let opportunityId: Int?
        public let organization: UUID?
        public let projectId: Int?
        public let serviceTicket: Int?
        public let status: Status
        public let templatesUsed: [Int]?
        public let updatedAt: String
        public let workingVersion: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case approvalInfo = "approval_info"
            case assumptions = "assumptions"
            case catalogItems = "catalog_items"
            case companyId = "company_id"
            case companyName = "company_name"
            case contactId = "contact_id"
            case createdAt = "created_at"
            case createdBy = "created_by"
            case expirationDate = "expiration_date"
            case id = "id"
            case laborHours = "labor_hours"
            case laborRate = "labor_rate"
            case name = "name"
            case opportunityId = "opportunity_id"
            case organization = "organization"
            case projectId = "project_id"
            case serviceTicket = "service_ticket"
            case status = "status"
            case templatesUsed = "templates_used"
            case updatedAt = "updated_at"
            case workingVersion = "working_version"
        }
        
        init(
            approvalInfo: AnyJSON? = nil,
            assumptions: String? = nil,
            catalogItems: [Int]? = nil,
            companyId: Int? = nil,
            companyName: String? = nil,
            contactId: Int? = nil,
            createdAt: String,
            createdBy: UUID? = nil,
            expirationDate: String? = nil,
            id: UUID,
            laborHours: Double,
            laborRate: Double,
            name: String,
            opportunityId: Int? = nil,
            organization: UUID? = nil,
            projectId: Int? = nil,
            serviceTicket: Int? = nil,
            status: Status,
            templatesUsed: [Int]? = nil,
            updatedAt: String
        ) {
            self.approvalInfo = approvalInfo
            self.assumptions = assumptions
            self.catalogItems = catalogItems
            self.companyId = companyId
            self.companyName = companyName
            self.contactId = contactId
            self.createdAt = createdAt
            self.createdBy = createdBy
            self.expirationDate = expirationDate
            self.id = id
            self.laborHours = laborHours
            self.laborRate = laborRate
            self.name = name
            self.opportunityId = opportunityId
            self.organization = organization
            self.projectId = projectId
            self.serviceTicket = serviceTicket
            self.status = status
            self.templatesUsed = templatesUsed
            self.updatedAt = updatedAt
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<PublicSchema.ProposalsSelect.CodingKeys> = try decoder.container(keyedBy: PublicSchema.ProposalsSelect.CodingKeys.self)
            self.approvalInfo = try container.decodeIfPresent(AnyJSON.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.approvalInfo)
            self.assumptions = try container.decodeIfPresent(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.assumptions)
            self.catalogItems = try container.decodeIfPresent([Int].self, forKey: PublicSchema.ProposalsSelect.CodingKeys.catalogItems)
            self.companyId = try container.decodeIfPresent(Int.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.companyId)
            self.companyName = try container.decodeIfPresent(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.companyName)
            self.contactId = try container.decodeIfPresent(Int.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.contactId)
            self.createdAt = try container.decode(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.createdAt)
            self.createdBy = try container.decodeIfPresent(UUID.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.createdBy)
            self.expirationDate = try container.decodeIfPresent(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.expirationDate)
            self.id = try container.decode(UUID.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.id)
            self.laborHours = try container.decode(Double.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.laborHours)
            self.laborRate = try container.decode(Double.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.laborRate)
            self.name = try container.decode(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.name)
            self.opportunityId = try container.decodeIfPresent(Int.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.opportunityId)
            self.organization = try container.decodeIfPresent(UUID.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.organization)
            self.projectId = try container.decodeIfPresent(Int.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.projectId)
            self.serviceTicket = try container.decodeIfPresent(Int.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.serviceTicket)
            self.status = try container.decode(PublicSchema.Status.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.status)
            self.templatesUsed = try container.decodeIfPresent([Int].self, forKey: PublicSchema.ProposalsSelect.CodingKeys.templatesUsed)
            self.updatedAt = try container.decode(String.self, forKey: PublicSchema.ProposalsSelect.CodingKeys.updatedAt)
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: PublicSchema.ProposalsSelect.CodingKeys.self)
            try container.encodeIfPresent(self.approvalInfo, forKey: PublicSchema.ProposalsSelect.CodingKeys.approvalInfo)
            try container.encodeIfPresent(self.assumptions, forKey: PublicSchema.ProposalsSelect.CodingKeys.assumptions)
            try container.encodeIfPresent(self.catalogItems, forKey: PublicSchema.ProposalsSelect.CodingKeys.catalogItems)
            try container.encodeIfPresent(self.companyId, forKey: PublicSchema.ProposalsSelect.CodingKeys.companyId)
            try container.encodeIfPresent(self.companyName, forKey: PublicSchema.ProposalsSelect.CodingKeys.companyName)
            try container.encodeIfPresent(self.contactId, forKey: PublicSchema.ProposalsSelect.CodingKeys.contactId)
            try container.encode(self.createdAt, forKey: PublicSchema.ProposalsSelect.CodingKeys.createdAt)
            try container.encodeIfPresent(self.createdBy, forKey: PublicSchema.ProposalsSelect.CodingKeys.createdBy)
            try container.encodeIfPresent(self.expirationDate, forKey: PublicSchema.ProposalsSelect.CodingKeys.expirationDate)
            try container.encode(self.id, forKey: PublicSchema.ProposalsSelect.CodingKeys.id)
            try container.encode(self.laborHours, forKey: PublicSchema.ProposalsSelect.CodingKeys.laborHours)
            try container.encode(self.laborRate, forKey: PublicSchema.ProposalsSelect.CodingKeys.laborRate)
            try container.encode(self.name, forKey: PublicSchema.ProposalsSelect.CodingKeys.name)
            try container.encodeIfPresent(self.opportunityId, forKey: PublicSchema.ProposalsSelect.CodingKeys.opportunityId)
            try container.encodeIfPresent(self.organization, forKey: PublicSchema.ProposalsSelect.CodingKeys.organization)
            try container.encodeIfPresent(self.projectId, forKey: PublicSchema.ProposalsSelect.CodingKeys.projectId)
            try container.encodeIfPresent(self.serviceTicket, forKey: PublicSchema.ProposalsSelect.CodingKeys.serviceTicket)
            try container.encode(self.status, forKey: PublicSchema.ProposalsSelect.CodingKeys.status)
            try container.encodeIfPresent(self.templatesUsed, forKey: PublicSchema.ProposalsSelect.CodingKeys.templatesUsed)
            try container.encode(self.updatedAt, forKey: PublicSchema.ProposalsSelect.CodingKeys.updatedAt)
            try container.encodeIfPresent(self.workingVersion, forKey: PublicSchema.ProposalsSelect.CodingKeys.workingVersion)
        }
    }
    public struct ProposalsInsert: Codable, Hashable, Sendable {
        public let approvalInfo: AnyJSON? = nil
        public let assumptions: String? = nil
        public let catalogItems: [Int]? = nil
        public let companyId: Int? = nil
        public let companyName: String? = nil
        public let contactId: Int? = nil
        public let createdAt: String? = nil
        public let createdBy: UUID? = nil
        public let expirationDate: String? = nil
        public let id: UUID? = nil
        public let laborHours: Double? = nil
        public let laborRate: Double? = nil
        public let name: String
        public let opportunityId: Int? = nil
        public let organization: UUID? = nil
        public let projectId: Int? = nil
        public let serviceTicket: Int? = nil
        public let status: Status? = nil
        public let templatesUsed: [Int]? = nil
        public let updatedAt: String? = nil
        public let workingVersion: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case approvalInfo = "approval_info"
            case assumptions = "assumptions"
            case catalogItems = "catalog_items"
            case companyId = "company_id"
            case companyName = "company_name"
            case contactId = "contact_id"
            case createdAt = "created_at"
            case createdBy = "created_by"
            case expirationDate = "expiration_date"
            case id = "id"
            case laborHours = "labor_hours"
            case laborRate = "labor_rate"
            case name = "name"
            case opportunityId = "opportunity_id"
            case organization = "organization"
            case projectId = "project_id"
            case serviceTicket = "service_ticket"
            case status = "status"
            case templatesUsed = "templates_used"
            case updatedAt = "updated_at"
            case workingVersion = "working_version"
        }
    }
    public struct ProposalsUpdate: Codable, Hashable, Sendable {
        public let approvalInfo: AnyJSON? = nil
        public let assumptions: String? = nil
        public let catalogItems: [Int]? = nil
        public let companyId: Int? = nil
        public let companyName: String? = nil
        public let contactId: Int? = nil
        public let createdAt: String? = nil
        public let createdBy: UUID? = nil
        public let expirationDate: String? = nil
        public let id: UUID? = nil
        public let laborHours: Double? = nil
        public let laborRate: Double? = nil
        public let name: String? = nil
        public let opportunityId: Int? = nil
        public let organization: UUID? = nil
        public let projectId: Int? = nil
        public let serviceTicket: Int? = nil
        public let status: Status? = nil
        public let templatesUsed: [Int]? = nil
        public let updatedAt: String? = nil
        public let workingVersion: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case approvalInfo = "approval_info"
            case assumptions = "assumptions"
            case catalogItems = "catalog_items"
            case companyId = "company_id"
            case companyName = "company_name"
            case contactId = "contact_id"
            case createdAt = "created_at"
            case createdBy = "created_by"
            case expirationDate = "expiration_date"
            case id = "id"
            case laborHours = "labor_hours"
            case laborRate = "labor_rate"
            case name = "name"
            case opportunityId = "opportunity_id"
            case organization = "organization"
            case projectId = "project_id"
            case serviceTicket = "service_ticket"
            case status = "status"
            case templatesUsed = "templates_used"
            case updatedAt = "updated_at"
            case workingVersion = "working_version"
        }
    }
    public struct SectionsSelect: Codable, Hashable, Sendable {
        public let createdAt: String
        public let id: UUID
        public let name: String
        public let order: Int
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case name = "name"
            case order = "order"
            case version = "version"
        }
    }
    public struct SectionsInsert: Codable, Hashable, Sendable {
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let name: String
        public let order: Int? = nil
        public let version: UUID
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case name = "name"
            case order = "order"
            case version = "version"
        }
    }
    public struct SectionsUpdate: Codable, Hashable, Sendable {
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let name: String? = nil
        public let order: Int? = nil
        public let version: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case name = "name"
            case order = "order"
            case version = "version"
        }
    }
    public struct TasksSelect: Codable, Hashable, Sendable {
        public let budgetHours: Double? = nil
        public let createdAt: String
        public let id: UUID
        public let notes: String
        public let order: Int16
        public let priority: Int16
        public let referenceId: Int? = nil
        public let summary: String
        public let ticket: UUID
        public let visibile: Bool
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case notes = "notes"
            case order = "order"
            case priority = "priority"
            case referenceId = "reference_id"
            case summary = "summary"
            case ticket = "ticket"
            case visibile = "visibile"
        }
    }
    public struct TasksInsert: Codable, Hashable, Sendable {
        public let budgetHours: Double? = nil
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let notes: String
        public let order: Int16? = nil
        public let priority: Int16
        public let referenceId: Int? = nil
        public let summary: String
        public let ticket: UUID
        public let visibile: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case notes = "notes"
            case order = "order"
            case priority = "priority"
            case referenceId = "reference_id"
            case summary = "summary"
            case ticket = "ticket"
            case visibile = "visibile"
        }
    }
    public struct TasksUpdate: Codable, Hashable, Sendable {
        public let budgetHours: Double? = nil
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let notes: String? = nil
        public let order: Int16? = nil
        public let priority: Int16? = nil
        public let referenceId: Int? = nil
        public let summary: String? = nil
        public let ticket: UUID? = nil
        public let visibile: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case notes = "notes"
            case order = "order"
            case priority = "priority"
            case referenceId = "reference_id"
            case summary = "summary"
            case ticket = "ticket"
            case visibile = "visibile"
        }
    }
    public struct TicketsSelect: Codable, Hashable, Sendable {
        public let budgetHours: Double
        public let createdAt: String
        public let id: UUID
        public let order: Double
        public let phase: UUID
        public let referenceId: Int? = nil
        public let summary: String
        public let visible: Bool
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case order = "order"
            case phase = "phase"
            case referenceId = "reference_id"
            case summary = "summary"
            case visible = "visible"
        }
    }
    public struct TicketsInsert: Codable, Hashable, Sendable {
        public let budgetHours: Double? = nil
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let order: Double? = nil
        public let phase: UUID
        public let referenceId: Int? = nil
        public let summary: String
        public let visible: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case order = "order"
            case phase = "phase"
            case referenceId = "reference_id"
            case summary = "summary"
            case visible = "visible"
        }
    }
    public struct TicketsUpdate: Codable, Hashable, Sendable {
        public let budgetHours: Double? = nil
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let order: Double? = nil
        public let phase: UUID? = nil
        public let referenceId: Int? = nil
        public let summary: String? = nil
        public let visible: Bool? = nil
        public enum CodingKeys: String, CodingKey {
            case budgetHours = "budget_hours"
            case createdAt = "created_at"
            case id = "id"
            case order = "order"
            case phase = "phase"
            case referenceId = "reference_id"
            case summary = "summary"
            case visible = "visible"
        }
    }
    public struct VersionsSelect: Codable, Hashable, Sendable {
        public let createdAt: String
        public let id: UUID
        public let number: Int16? = nil
        public let proposal: UUID
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case number = "number"
            case proposal = "proposal"
        }
    }
    public struct VersionsInsert: Codable, Hashable, Sendable {
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let number: Int16? = nil
        public let proposal: UUID
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case number = "number"
            case proposal = "proposal"
        }
    }
    public struct VersionsUpdate: Codable, Hashable, Sendable {
        public let createdAt: String? = nil
        public let id: UUID? = nil
        public let number: Int16? = nil
        public let proposal: UUID? = nil
        public enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id = "id"
            case number = "number"
            case proposal = "proposal"
        }
    }
}
public enum ReportingSchema {
    public struct ConversationsSelect: Codable, Hashable, Sendable {
        public let abandonTime: Int? = nil
        public let abandoned: String? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let date: String
        public let direction: String? = nil
        public let holdTime: Int? = nil
        public let id: String
        public let inBusinessHours: Bool? = nil
        public let outcome: String? = nil
        public let phoneNumber: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let talkTime: Int? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abandonTime = "abandon_time"
            case abandoned = "abandoned"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case date = "date"
            case direction = "direction"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case outcome = "outcome"
            case phoneNumber = "phone_number"
            case queue = "queue"
            case queueTime = "queue_time"
            case talkTime = "talk_time"
            case workflow = "workflow"
        }
    }
    public struct ConversationsInsert: Codable, Hashable, Sendable {
        public let abandonTime: Int? = nil
        public let abandoned: String? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let date: String? = nil
        public let direction: String? = nil
        public let holdTime: Int? = nil
        public let id: String
        public let inBusinessHours: Bool? = nil
        public let outcome: String? = nil
        public let phoneNumber: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let talkTime: Int? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abandonTime = "abandon_time"
            case abandoned = "abandoned"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case date = "date"
            case direction = "direction"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case outcome = "outcome"
            case phoneNumber = "phone_number"
            case queue = "queue"
            case queueTime = "queue_time"
            case talkTime = "talk_time"
            case workflow = "workflow"
        }
    }
    public struct ConversationsUpdate: Codable, Hashable, Sendable {
        public let abandonTime: Int? = nil
        public let abandoned: String? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let date: String? = nil
        public let direction: String? = nil
        public let holdTime: Int? = nil
        public let id: String? = nil
        public let inBusinessHours: Bool? = nil
        public let outcome: String? = nil
        public let phoneNumber: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let talkTime: Int? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abandonTime = "abandon_time"
            case abandoned = "abandoned"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case date = "date"
            case direction = "direction"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case outcome = "outcome"
            case phoneNumber = "phone_number"
            case queue = "queue"
            case queueTime = "queue_time"
            case talkTime = "talk_time"
            case workflow = "workflow"
        }
    }
    public struct ConversationsNewSelect: Codable, Hashable, Sendable {
        public let abanded: String? = nil
        public let abandonTime: Int? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let conversation: String? = nil
        public let date: String? = nil
        public let direction: String? = nil
        public let externalContact: String? = nil
        public let holdTime: Int? = nil
        public let id: UUID
        public let inBusinessHours: Bool? = nil
        public let kind: String? = nil
        public let outcome: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let ringTime: Int? = nil
        public let talkTime: Int? = nil
        public let time: String? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abanded = "abanded"
            case abandonTime = "abandon_time"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case conversation = "conversation"
            case date = "date"
            case direction = "direction"
            case externalContact = "external_contact"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case kind = "kind"
            case outcome = "outcome"
            case queue = "queue"
            case queueTime = "queue_time"
            case ringTime = "ring_time"
            case talkTime = "talk_time"
            case time = "time"
            case workflow = "workflow"
        }
    }
    public struct ConversationsNewInsert: Codable, Hashable, Sendable {
        public let abanded: String? = nil
        public let abandonTime: Int? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let conversation: String? = nil
        public let date: String? = nil
        public let direction: String? = nil
        public let externalContact: String? = nil
        public let holdTime: Int? = nil
        public let id: UUID? = nil
        public let inBusinessHours: Bool? = nil
        public let kind: String? = nil
        public let outcome: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let ringTime: Int? = nil
        public let talkTime: Int? = nil
        public let time: String? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abanded = "abanded"
            case abandonTime = "abandon_time"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case conversation = "conversation"
            case date = "date"
            case direction = "direction"
            case externalContact = "external_contact"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case kind = "kind"
            case outcome = "outcome"
            case queue = "queue"
            case queueTime = "queue_time"
            case ringTime = "ring_time"
            case talkTime = "talk_time"
            case time = "time"
            case workflow = "workflow"
        }
    }
    public struct ConversationsNewUpdate: Codable, Hashable, Sendable {
        public let abanded: String? = nil
        public let abandonTime: Int? = nil
        public let abandonedPhase: String? = nil
        public let agent: String? = nil
        public let communicationChannel: String? = nil
        public let companyId: Int? = nil
        public let contactId: Int? = nil
        public let conversation: String? = nil
        public let date: String? = nil
        public let direction: String? = nil
        public let externalContact: String? = nil
        public let holdTime: Int? = nil
        public let id: UUID? = nil
        public let inBusinessHours: Bool? = nil
        public let kind: String? = nil
        public let outcome: String? = nil
        public let queue: String? = nil
        public let queueTime: Int? = nil
        public let ringTime: Int? = nil
        public let talkTime: Int? = nil
        public let time: String? = nil
        public let workflow: String? = nil
        public enum CodingKeys: String, CodingKey {
            case abanded = "abanded"
            case abandonTime = "abandon_time"
            case abandonedPhase = "abandoned_phase"
            case agent = "agent"
            case communicationChannel = "communication_channel"
            case companyId = "company_id"
            case contactId = "contact_id"
            case conversation = "conversation"
            case date = "date"
            case direction = "direction"
            case externalContact = "external_contact"
            case holdTime = "hold_time"
            case id = "id"
            case inBusinessHours = "in_business_hours"
            case kind = "kind"
            case outcome = "outcome"
            case queue = "queue"
            case queueTime = "queue_time"
            case ringTime = "ring_time"
            case talkTime = "talk_time"
            case time = "time"
            case workflow = "workflow"
        }
    }
}
