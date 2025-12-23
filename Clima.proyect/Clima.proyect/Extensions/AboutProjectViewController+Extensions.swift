import UIKit

extension AboutProjectViewController {

    func setupUI() {
        // Configuración de icono
        iconImageView.applyIconStyle(systemName: "info.circle.fill")
        
        // Configuración de botón
        creditsButton.applyDefaultStyle(title: "Ver créditos")
        creditsButton.addTarget(self, action: #selector(didTapCredits), for: .touchUpInside)
    }
  
}
