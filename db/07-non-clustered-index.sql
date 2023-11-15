USE HomeCredit;
GO

SET ANSI_PADDING ON
GO

-- Non-clustered index on the Application table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-130746] ON [Application].[Application]
(
	[type] ASC,
	[credit_amount] ASC,
	[annuity_amount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Balance table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-130947] ON [Application].[Balance]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Client table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-131057] ON [Client].[Client]
(
	[gender] ASC,
	[occupation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Credit_Bureau_Application table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-131208] ON [Credit_Bureau].[Credit_Bureau_Application]
(
    [application_id] ASC,
	[status] ASC,
	[amount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Credit_Card_Balance table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-131447] ON [Previous_Application].[Credit_Card_Balance]
(
	[balance] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Installment_Payment table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-131652] ON [Previous_Application].[Installment_Payment]
(
	[amount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

-- Non-clustered index on the Previous_Application table
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231114-131856] ON [Previous_Application].[Previous_Application]
(
	[application_id] ASC,
	[credit_amount] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO

USE master;
GO