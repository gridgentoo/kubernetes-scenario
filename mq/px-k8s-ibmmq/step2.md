Чтобы использовать тома **Portworx volumes**, нам необходимо взаимодействовать с существующими примитивами хранилища **Kubernetes storage primitives**. На этом этапе мы создадим том **Portworx volume (PVC)** для **IBM MQ**.

### Step: Создание StorageClass и PersistentVolumeClaim  
 
Начнем с **StorageClass**. Взгляните на определение **StorageClass definition** для **Portworx**. Вы заметите, что мы устанавливаем коэффициент репликации **replication factor** равным 3. Это обеспечит репликацию данных на два других узла кластера.
```
echo "$(cat px-mq-sc.yaml)"
```{{execute T1}}

The parameters are declarative policies for your storage volume. See [here](https://docs.portworx.com/manage/volumes.html) for a full list of supported parameters.
Параметры представляют собой декларативные политики для вашего тома хранения. См. Здесь [here](https://docs.portworx.com/manage/volumes.html) для получения полного списка поддерживаемых параметров.
  
Создайте класс хранилища **storage class**, используя:
```
kubectl create -f px-mq-sc.yaml
```{{execute T1}}

Взгляните на требование постоянного объема **Persistent Volume Claim**
```
echo "$(cat px-mq-pvc.yaml)"
```{{execute T1}}

Это определяет **defines**  максимальный размер тома **maximum volume size**.
**Portworx** предоставляет том  **provision the volume** и позволит ему вырасти до 5 ГБ.

Создайте **PersistentVolumeClaim**, используя:
```
kubectl create -f px-mq-pvc.yaml
```{{execute T1}}

Теперь, когда у нас созданы тома **volumes created**, давайте задеплоим **IBM MQ**!