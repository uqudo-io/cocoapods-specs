Pod::Spec.new do |s|
  s.name             = 'TensorFlowLiteObjC'
  s.version          = '2.20.0'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'Apache' }
  s.homepage         = 'https://github.com/tensorflow/tensorflow'
  s.source           = { :git => 'https://github.com/tensorflow/tensorflow.git', :tag => "v#{s.version}" }
  s.summary          = 'TensorFlow Lite for Objective-C'
  s.description      = <<-DESC

  TensorFlow Lite is TensorFlow's lightweight solution for Objective-C
  developers. It enables low-latency inference of on-device machine learning
  models with a small binary size and fast performance supporting hardware
  acceleration.
                       DESC

  s.cocoapods_version = '>= 1.9.0'
  s.ios.deployment_target = '12.0'

  s.module_name = 'TFLTensorFlowLite'
  s.static_framework = true

  tfl_dir = 'tensorflow/lite/'
  objc_dir = tfl_dir + 'objc/'

  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' =>
      '"${PODS_TARGET_SRCROOT}" ' +
      '"${PODS_TARGET_SRCROOT}/' + objc_dir  + 'apis"',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.public_header_files = objc_dir + 'apis/*.h'
    core.source_files = [
      objc_dir + '{apis,sources}/*.{h,m,mm}',
      tfl_dir + 'builtin_ops.h',
      tfl_dir + 'c/c_api.h',
      tfl_dir + 'core/c/c_api.h',
      tfl_dir + 'c/c_api_experimental.h',
      tfl_dir + 'c/c_api_types.h',
      tfl_dir + 'c/common.h',
      tfl_dir + 'delegates/xnnpack/xnnpack_delegate.h',
      tfl_dir + 'core/c/operator.h',
    ]
    core.exclude_files = [
      objc_dir + '{apis,sources}/TFL{Metal,CoreML}Delegate.{h,m}',
    ]
    core.dependency 'TensorFlowLiteC', "#{s.version}"

    core.test_spec 'Tests' do |ts|
      ts.source_files = objc_dir + 'tests/*.m'
      ts.exclude_files = objc_dir + 'tests/TFL{Metal,CoreML}DelegateTests.m'
      ts.resources = [
        tfl_dir + 'testdata/add.bin',
        tfl_dir + 'testdata/add_quantized.bin',
        tfl_dir + 'testdata/multi_signatures.bin',
      ]
    end
  end

end
