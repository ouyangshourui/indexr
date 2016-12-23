SCRIPT_DIR=$(cd $(dirname $0);echo $PWD)
cd ${SCRIPT_DIR}/..
ROOT_DIR=$(echo $PWD)
source ${ROOT_DIR}/script/env.sh

cd ${ROOT_DIR}

sh ${ROOT_DIR}/script/compile_indexr-hive.sh

# copy hive files
rm -rf ${ROOT_DIR}/distribution/indexr-hive/aux
mkdir -p ${ROOT_DIR}/distribution/indexr-hive/aux

function cp_ref {
    cp -f $1 ${ROOT_DIR}/distribution/indexr-hive/aux/
}

cp_ref ${ROOT_DIR}/indexr-common/target/indexr-common-${VERSION}.jar
cp_ref ${ROOT_DIR}/indexr-segment/target/indexr-segment-${VERSION}.jar
cp_ref ${ROOT_DIR}/indexr-hive/target/indexr-hive-${VERSION}.jar

# copy other depenencies

cp_ref ${MAVEN_PATH}/org/apache/spark/spark-unsafe_2.10/1.6.0/spark-unsafe_2.10-1.6.0.jar
cp_ref ${MAVEN_PATH}/com/esotericsoftware/kryo/kryo/2.21/kryo-2.21.jar

cp_ref ${MAVEN_PATH}/com/fasterxml/jackson/core/jackson-core/2.6.2/jackson-core-2.6.2.jar
cp_ref ${MAVEN_PATH}/com/fasterxml/jackson/core/jackson-databind/2.6.2/jackson-databind-2.6.2.jar
cp_ref ${MAVEN_PATH}/com/fasterxml/jackson/core/jackson-annotations/2.6.0/jackson-annotations-2.6.0.jar
cp_ref ${MAVEN_PATH}/net/java/dev/jna/jna/4.2.1/jna-4.2.1.jar
cp_ref ${MAVEN_PATH}/org/jodd/jodd-core/3.6.7/jodd-core-3.6.7.jar

