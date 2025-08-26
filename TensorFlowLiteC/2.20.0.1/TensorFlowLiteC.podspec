Pod::Spec.new do |s|
  s.name             = 'TensorFlowLiteC'
  s.version          = '2.20.0.1'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'Apache', :text => '' }
  s.homepage         = 'https://github.com/tensorflow/tensorflow'
  s.source           = { :http => "https://rm.dev.uqudo.io/repository/cocoapods-components/org/tensorflow/TensorFlowLiteC/2.20.0.1/TensorFlowLiteC-2.20.0.1.zip", :sha256 => "d822f3afd012f1992a1acbc5ec2c79b4b0080f971d40e988d2de1e871933f305" }
  s.summary          = 'TensorFlow Lite'
  s.description      = <<-DESC

  An internal-only pod containing the TensorFlow Lite C library that the public
  `TensorFlowLiteSwift` and `TensorFlowLiteObjC` pods depend on. This pod is not
  intended to be used directly. Swift developers should use the
  `TensorFlowLiteSwift` pod and Objective-C developers should use the
  `TensorFlowLiteObjC` pod.
                       DESC

  s.cocoapods_version = '>= 1.9.0'
  s.ios.deployment_target = '12.0'

  s.module_name = 'TensorFlowLiteC'
  s.library = 'c++'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'TensorFlowLiteC.xcframework'
  end

end

