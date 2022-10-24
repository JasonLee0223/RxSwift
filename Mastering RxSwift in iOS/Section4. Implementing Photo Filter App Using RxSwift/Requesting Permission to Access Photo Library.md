# Requesting Permission to Accesss Photo Library
photoCollectionViewcontroller에 사진 라이브러리의 사진을 표시하기 전에 사진 라이브러리에 액세스할 수 있는 권한을 사용자에게 요청해야 합니다.   

가장 먼저 해야 할 일은 해당 작업을 수행할 사진을 가져오고 있는지 확인하는 것입니다.
특정 프레임워크인 Photos 프레임워크에는 실제로 필요한 많은 것들이 포함되어 있기 때문입니다.   
사진으로 수행해야 하는 모든 작업은 Photos 프레임워크의 일부가 됩니다.   

## 🟢 Use Photos framework
이제 PopularPhotos() 내부에서 사진을 채울 것입니다.

하지만 그렇게 하기 전에 사용자 권한을 요청해야 하므로 해당 부분을 수행하는 방법을 살펴보겠습니다.

권한 부분은 PHPhotoLibrary의 일부이므로 PHPhotolibrary.request 권한을 요청하거나 권한 부여를 요청하면 클로저 내부의 권한 부여 상태가 표시되는 것을 볼 수 있습니다.
승인이 거부 또는 승인 등일 수 있음을 의미합니다.

```Swift
import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
}
```

우리는 상태를 얻을 것입니다. 이것은 거부될 수 있습니다. 그리고 이것은 우리가 찾고 있는 이러한 종류의 상태에 대해 승인되거나 승인될 수 있습니다.
이것이 사용자가 실제로 PhotoLibrary를 사용하거나 PhotoLibrary에 액세스할 수 있도록 승인했다는 의미입니다.

```Swift
private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                
                // access the photos from photo library
            }
        }
    }
```
Build를 해보면 에러가 발생하는 것을 볼 수 있다.
```Markdown
CameraFilter[55042:4094634] [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data.
```

## 🟢 PrivateKey 적용하기
이 파일을 입력할 때 `NSPhotoLibraryUsageDescription` 키인 키가 없기 때문임을 알 수 있습니다.
특정 키를 추가해 보겠습니다.

<img src ="https://user-images.githubusercontent.com/92699723/197463457-4164dd8e-23e3-4fec-92cd-e37306b3dcf4.png" width="700" height="300">
<img src ="https://user-images.githubusercontent.com/92699723/197463450-cf6b4edc-d148-4002-8ba8-33d7e842869c.png" width="700" height="100">

해당 특정 키의 값에 대한 설명에서 원하는 메시지를 입력할 수 있습니다.   
이는 사용자에게 사진 라이브러리에 대한 액세스 권한을 요청하는 이유에 대한 추가 정보를 알려줄 것입니다.

그래서 저는 실제로 여기로 가서 카메라 필터 앱이 사진 라이브러리에 액세스할 수 있는 권한이 필요하다고 말할 수 있습니다.
다른 요구 사항이 있는 경우 원하는 만큼 설명할 수 있습니다. 실제로 바로 거기에 넣을 수 있습니다.
다시 Build후 사진 추가 버튼을 눌러보면 아래와 같이 바뀐 것을 확인할 수 있다.   
<img src="https://user-images.githubusercontent.com/92699723/197463911-e9492189-2574-40a2-a184-6f1e699cbe7e.png" widht="300" height="600">   
그러나 해당 카메라 필터는 사진에 액세스하려고 합니다.   
카메라는 사진 라이브러리에 액세스할 수 있는 권한을 요청합니다. 이는 우리가 소개 목록에 입력한 정확한 메시지입니다.   
자, 이제 이 시점에서 사용자에게 사진 라이브러리에 대한 액세스 권한을 요청했습니다.