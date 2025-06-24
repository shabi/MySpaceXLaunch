protocol FilterViewModelProtocol: ObservableObject {
    var model: FilterModel { get set }
    var isApplyEnabled: Bool { get }
    var isResetEnabled: Bool { get }

    func reset()
    func apply()
    func updateTimeframe(_ timeframe: Timeframe)
    func updateTransactionType(_ type: TransactionType?)
}

class FilterViewModel: FilterViewModelProtocol {
    @Published var model: FilterModel {
        didSet {
            updateButtonStates()
        }
    }

    @Published private(set) var isApplyEnabled = false
    @Published private(set) var isResetEnabled = false

    init() {
        self.model = FilterModel(
            timeframe: .custom,
            startDate: nil,
            endDate: nil,
            transactionType: nil,
            minAmount: "",
            maxAmount: ""
        )
        updateButtonStates()
    }

    func reset() {
        model = FilterModel(
            timeframe: .custom,
            startDate: nil,
            endDate: nil,
            transactionType: nil,
            minAmount: "",
            maxAmount: ""
        )
    }

    func apply() {
        print("Apply logic with: \(model)")
    }

    func updateTimeframe(_ timeframe: Timeframe) {
        model.timeframe = timeframe
    }

    func updateTransactionType(_ type: TransactionType?) {
        model.transactionType = type
    }

    private func updateButtonStates() {
        let hasValidTimeframe = model.timeframe != .custom
        let hasTransactionType = model.transactionType != nil
        let hasAmount = !(model.minAmount.trimmingCharacters(in: .whitespaces).isEmpty) ||
                        !(model.maxAmount.trimmingCharacters(in: .whitespaces).isEmpty)

        let anyFieldSelected = hasValidTimeframe || hasTransactionType || hasAmount

        isApplyEnabled = anyFieldSelected
        isResetEnabled = anyFieldSelected
    }
}


import SwiftUI

struct FilterView<VM: FilterViewModelProtocol>: View {
    @ObservedObject var viewModel: VM

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Filter")
                    .font(.headline)

                // Timeframe Section
                VStack(alignment: .leading) {
                    Text("Timeframe")
                        .font(.subheadline)

                    ForEach(Timeframe.allCases) { item in
                        HStack {
                            Image(systemName: viewModel.model.timeframe == item ? "largecircle.fill.circle" : "circle")
                                .onTapGesture {
                                    viewModel.updateTimeframe(item)
                                }
                            Text(item.rawValue)
                                .onTapGesture {
                                    viewModel.updateTimeframe(item)
                                }
                        }
                    }
                }

                // Custom Date Pickers
                if viewModel.model.timeframe == .custom {
                    VStack(alignment: .leading) {
                        Text("Start date")
                        DatePicker("",
                                   selection: Binding(
                                        get: { viewModel.model.startDate ?? Date() },
                                        set: { viewModel.model.startDate = $0 }
                                   ),
                                   displayedComponents: .date)
                            .labelsHidden()

                        Text("End date")
                        DatePicker("",
                                   selection: Binding(
                                        get: { viewModel.model.endDate ?? Date() },
                                        set: { viewModel.model.endDate = $0 }
                                   ),
                                   displayedComponents: .date)
                            .labelsHidden()
                    }
                }

                // Transaction Type
                VStack(alignment: .leading, spacing: 10) {
                    Text("Transaction type")

                    HStack {
                        Button("Debit") {
                            viewModel.updateTransactionType(.debit)
                        }
                        .padding()
                        .background(viewModel.model.transactionType == .debit ? Color.blue : Color.gray.opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        Button("Credit") {
                            viewModel.updateTransactionType(.credit)
                        }
                        .padding()
                        .background(viewModel.model.transactionType == .credit ? Color.blue : Color.gray.opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }

                // Transaction Amount Range
                VStack(alignment: .leading, spacing: 10) {
                    Text("Transaction Amount")
                    HStack {
                        TextField("0", text: $viewModel.model.minAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)

                        Text("to")

                        TextField("Any", text: $viewModel.model.maxAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }

                Spacer()

                // Reset and Apply Buttons
                HStack {
                    Button("Reset") {
                        viewModel.reset()
                    }
                    .disabled(!viewModel.isResetEnabled)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isResetEnabled ? Color.gray.opacity(0.3) : Color.gray.opacity(0.1))
                    .foregroundColor(viewModel.isResetEnabled ? .black : .gray)
                    .cornerRadius(10)

                    Button("Apply") {
                        viewModel.apply()
                    }
                    .disabled(!viewModel.isApplyEnabled)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isApplyEnabled ? Color.blue : Color.gray.opacity(0.1))
                    .foregroundColor(viewModel.isApplyEnabled ? .white : .gray)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
