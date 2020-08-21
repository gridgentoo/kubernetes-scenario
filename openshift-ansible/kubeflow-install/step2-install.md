Чтобы настроить **Kubeflow** в этом кластере **Kubernetes**, необходимо выполнить три вещи:

1. установка инструмента из командной строки **command-line tool**
2. Постоянное резервирование **Persistence reservation**
3. Установка фреймворка **Kubeflow**

## Kubeflow CLI

```
curl -LO http://assets.joinscrapbook.com/kubeflow/kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
tar -xvf kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
mv kfctl /usr/local/bin/
chmod +x /usr/local/bin/kfctl
rm kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
```{{execute}}

Убедитесь, что инструмент командной строки доступен.

`kfctl version`{{execute}}

Всякий раз, когда вы добавляете инструмент **CLI tool**, часто появляется функция завершения, которая позволяет полезно заполнить контекст для параметров командной строки **command-line parameters** с помощью клавиши табуляции.

`source <(kfctl completion bash)`{{execute}}

## Persistence

Создайте 10 постоянных томов **Persistent Volumes**, которые в конечном итоге будут связаны сервисами **Kubeflow services**.

```
for i in {1..10}; do
   cat pv.yaml | sed "s/volname/pv$i/g" | sed "s/volsize/50Gi/g" | sed "s#volpath#/opt/vol/pv$i#" | kubectl apply -f -
   mkdir -p "/opt/vol/pv$i"
   chmod 777 "/opt/vol/pv$i"
   ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no node01 "mkdir -p /opt/vol/pv$i; chmod 777 /opt/vol/pv$i"
done
```{{execute}}

## Installation

Подготовьте установочную папку и переменные.

```
export BASE_DIR=/opt
export KF_NAME=kf-install
export KF_DIR=${BASE_DIR}/${KF_NAME}
export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/v0.7-branch/kfdef/kfctl_k8s_istio.0.7.1.yaml"
rm -rf ${KF_DIR}
mkdir -p ${KF_DIR}
cd ${KF_DIR}
```{{execute}}

Используя инструмент **kfctl tool** установите **Kubeflow**. К сожалению, из-за некоторой проблемы с идемпотентностью, установка должна выполняться в цикле, пока она не заработает. Мы ожидаем, что эта проблема будет решена в ближайшее время.

```
for i in {1..10}; do
  kfctl apply -V -f ${CONFIG_URI}

  EXITCODE=$?
  if [ $EXITCODE -eq 0 ]; then
    break;
  fi

  rm -rf *
  sleep 2
  clear
done
```{{execute}}


Все услуги станут доступны в течение 5-10 минут. В рамках платформы **Kubeflow** создано более 500 различных ресурсов. **Kubeflow** - это проект, в котором многие люди работают над объединением всех этих ресурсов в разумный рабочий процесс для разработки, развертывания, обслуживания и обработки ваших решений для машинного обучения.

Пока он запускается, вы можете исследовать различные службы в стеке **Kubeflow stack**.
