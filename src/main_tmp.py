import sys
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, 
                             QPushButton, QLabel, QLineEdit, QComboBox, QStackedWidget, 
                             QFrame, QTabWidget, QGridLayout, QSpacerItem, QSizePolicy, QFileDialog, QMessageBox,
                             QCheckBox)
from PyQt6.QtGui import QFont, QIcon, QPixmap
from PyQt6.QtCore import Qt, QSize

class OpenDikeApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("🌊 OpenDike Demo 🌊")
        self.setGeometry(100, 100, 1200, 800)
        
        self.dark_mode = False
        self.load_stylesheet()

        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.main_layout = QVBoxLayout(self.central_widget)

        self.header = self.create_header()
        self.main_layout.addWidget(self.header)

        self.content_stack = QStackedWidget()
        self.main_layout.addWidget(self.content_stack)

        self.setup_home_page()
        self.setup_create_project_page()
        self.setup_results_page()
        self.setup_settings_page()

    def load_stylesheet(self):
        self.light_style = """
        QMainWindow, QWidget {
            background-color: white;
            color: #333;
        }
        QPushButton {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
        }
        QPushButton:hover {
            background-color: #2980b9;
        }
        QLineEdit, QComboBox {
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 5px;
        }
        QLabel {
            font-size: 14px;
        }
        """
        
        self.dark_style = """
        QMainWindow, QWidget {
            background-color: #1e1e1e;
            color: #ffffff;
        }
        QPushButton {
            background-color: #378799;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
        }
        QPushButton:hover {
            background-color: #386c9a;
        }
        QLineEdit, QComboBox {
            border: 1px solid #333;
            background-color: #2c2c2c;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        QLabel {
            font-size: 14px;
        }
        """
        
        self.setStyleSheet(self.light_style)

    def create_header(self):
        header = QWidget()
        layout = QHBoxLayout(header)
        
        title = QLabel("")
        title.setFont(QFont("Arial", 20, QFont.Weight.Bold))
        layout.addWidget(title, alignment=Qt.AlignmentFlag.AlignCenter)
        layout.setAlignment(title, Qt.AlignmentFlag.AlignCenter)
        
        settings_btn = QPushButton()
        settings_btn.setIcon(QIcon("../assets/settings.png"))
        settings_btn.setFixedSize(30, 30)
        settings_btn.clicked.connect(lambda: self.content_stack.setCurrentIndex(3))
        layout.addWidget(settings_btn)
        
        return header

    def setup_home_page(self):
        home_page = QWidget()
        layout = QVBoxLayout(home_page)
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        card = QFrame()
        card_layout = QVBoxLayout(card)

        button_layout = QHBoxLayout()

        welcome_label = QLabel("Welcome to OpenDike! 🌊")
        welcome_label.setFont(QFont("Arial", 18, QFont.Weight.Bold))
        card_layout.addWidget(welcome_label, alignment=Qt.AlignmentFlag.AlignCenter)

        description = QLabel("Choose an action to get started")
        card_layout.addWidget(description, alignment=Qt.AlignmentFlag.AlignCenter)

        new_project_btn = QPushButton("New Project")
        new_project_btn.setFixedSize(200, 100)
        new_project_btn.setFont(QFont("Arial", 25, QFont.Weight.Bold))
        new_project_btn.clicked.connect(lambda: self.content_stack.setCurrentIndex(1))
        button_layout.addWidget(new_project_btn)

        open_project_btn = QPushButton("Open Project")
        open_project_btn.setFixedSize(200, 100)
        open_project_btn.setFont(QFont("Arial", 25, QFont.Weight.Bold))
        open_project_btn.clicked.connect(self.open_project)
        button_layout.addWidget(open_project_btn)

        card_layout.addLayout(button_layout)

        layout.addWidget(card)
        layout.addStretch()

        self.content_stack.addWidget(home_page)

    def setup_create_project_page(self):
        create_project_page = QWidget()
        layout = QVBoxLayout(create_project_page)

        card = QFrame()
        card.setFrameShape(QFrame.Shape.Box)
        card_layout = QVBoxLayout(card)

        title = QLabel("Create New Project")
        title.setFont(QFont("Arial", 18, QFont.Weight.Bold))
        card_layout.addWidget(title)

        form_layout = QVBoxLayout()

        form_layout.addWidget(QLabel("Project Name:"))
        self.project_name_input = QLineEdit()
        self.project_name_input.setPlaceholderText("Enter project name")
        form_layout.addWidget(self.project_name_input)
        
        form_layout.addWidget(QLabel("Hypothesis:"))
        hypothesis_combo = QComboBox()
        hypothesis_combo.addItems(["Select hypothesis", "Hypothesis 1", "Hypothesis 2"])
        form_layout.addWidget(hypothesis_combo)

        form_layout.addWidget(QLabel("Field 1:"))
        self.field1_input = QLineEdit()
        self.field1_input.setPlaceholderText("Enter Field 1")
        form_layout.addWidget(self.field1_input)

        form_layout.addWidget(QLabel("Field 2:"))
        self.field2_input = QLineEdit()
        self.field2_input.setPlaceholderText("Enter Field 2")
        form_layout.addWidget(self.field2_input)

        card_layout.addLayout(form_layout)

        button_layout = QHBoxLayout()
        back_btn = QPushButton("Back")
        back_btn.clicked.connect(lambda: self.content_stack.setCurrentIndex(0))
        button_layout.addWidget(back_btn)

        calculate_btn = QPushButton("Calculate")
        calculate_btn.clicked.connect(self.calculate)
        button_layout.addWidget(calculate_btn)

        card_layout.addLayout(button_layout)

        layout.addWidget(card)
        layout.addStretch()

        self.content_stack.addWidget(create_project_page)

    def setup_results_page(self):
        results_page = QWidget()
        layout = QGridLayout(results_page)

        # Left card
        left_card = QFrame()
        left_card.setFrameShape(QFrame.Shape.Box)
        left_layout = QVBoxLayout(left_card)

        left_layout.addWidget(QLabel("Project Results"))
        self.result_project_name = QLineEdit()
        left_layout.addWidget(self.result_project_name)

        left_layout.addWidget(QLabel("Field 1:"))
        self.result_field1 = QLineEdit()
        left_layout.addWidget(self.result_field1)

        left_layout.addWidget(QLabel("Field 2:"))
        self.result_field2 = QLineEdit()
        left_layout.addWidget(self.result_field2)

        recalculate_btn = QPushButton("Recalculate")
        recalculate_btn.clicked.connect(self.recalculate)
        left_layout.addWidget(recalculate_btn)

        layout.addWidget(left_card, 0, 0)

        # Right card
        right_card = QFrame()
        right_card.setFrameShape(QFrame.Shape.Box)
        right_layout = QVBoxLayout(right_card)

        dike_pixmap = QPixmap("../assets/dike.png")

        right_layout.addWidget(QLabel("Dike Simulation"))
        simulation_placeholder = QLabel("Simulation Placeholder")
        simulation_placeholder.setPixmap(dike_pixmap)
        simulation_placeholder.setStyleSheet("background-color: #dcdde1; min-height: 200px;")
        right_layout.addWidget(simulation_placeholder)

        tabs = QTabWidget()
        equations_tab = QWidget()
        equations_layout = QVBoxLayout(equations_tab)
        equations_layout.addWidget(QLabel("V = I × R"))
        tabs.addTab(equations_tab, "Equations")

        features_tab = QWidget()
        features_layout = QVBoxLayout(features_tab)
        features_layout.addWidget(QLabel("Example Text :D"))
        tabs.addTab(features_tab, "Features")

        right_layout.addWidget(tabs)

        layout.addWidget(right_card, 0, 1)

        back_btn = QPushButton("Back")
        back_btn.clicked.connect(lambda: self.content_stack.setCurrentIndex(1))
        layout.addWidget(back_btn, 1, 0, 1, 2)

        self.content_stack.addWidget(results_page)

    def setup_settings_page(self):
        settings_page = QWidget()
        layout = QVBoxLayout(settings_page)

        card = QFrame()
        card.setFrameShape(QFrame.Shape.Box)
        card_layout = QVBoxLayout(card)

        title = QLabel("Settings")
        title.setFont(QFont("Arial", 18, QFont.Weight.Bold))
        card_layout.addWidget(title)

        dark_mode_layout = QHBoxLayout()
        dark_mode_layout.addWidget(QLabel("Dark Mode"))
        self.dark_mode_switch = QCheckBox()
        self.dark_mode_switch.stateChanged.connect(self.toggle_dark_mode)
        dark_mode_layout.addWidget(self.dark_mode_switch)
        card_layout.addLayout(dark_mode_layout)

        back_btn = QPushButton("Back to Home")
        back_btn.clicked.connect(lambda: self.content_stack.setCurrentIndex(0))
        card_layout.addWidget(back_btn)

        layout.addWidget(card)
        layout.addStretch()

        self.content_stack.addWidget(settings_page)

    def open_project(self):
        file_name, _ = QFileDialog.getOpenFileName(self, "Open Project", "", "OpenDike Project Files (*.odp)")
        if file_name:
            print(f"Opening project: {file_name}")
            # Here you would add logic to load the project

    def calculate(self):
        if not self.project_name_input.text():
            QMessageBox.warning(self, "Warning", "Please enter a project name.")
            return
        
        self.result_project_name.setText(self.project_name_input.text())
        self.result_field1.setText(self.field1_input.text())
        self.result_field2.setText(self.field2_input.text())
        self.content_stack.setCurrentIndex(2)  # Switch to results page

    def recalculate(self):
        print("Recalculating...")
        QMessageBox.information(self, "Recalculate", "Recalculating...")

    def toggle_dark_mode(self, state):
        self.dark_mode = state == Qt.CheckState.Checked.value
        self.setStyleSheet(self.dark_style if self.dark_mode else self.light_style)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = OpenDikeApp()
    window.show()
    sys.exit(app.exec())