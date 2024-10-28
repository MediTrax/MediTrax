package database

import (
	"context"
	"io"
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"github.com/minio/minio-go/v7/pkg/tags"
)

var minioClient minio.Client
var bucketName string

func init() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	endpoint := os.Getenv("MINIO_URL")
	accessKeyID := os.Getenv("MINIO_ACCESS_KEY_ID")
	secretAccessKey := os.Getenv("MINIO_ACCESS_KEY_SECRET")
	useSSL := true

	// Initialize minio client object.
	myminioClient, err := minio.New(endpoint, &minio.Options{
		Creds:  credentials.NewStaticV4(accessKeyID, secretAccessKey, ""),
		Secure: useSSL,
	})
	if err != nil {
		log.Fatalln(err)
	}
	minioClient = *myminioClient
	bucketName = os.Getenv("MINIO_BUCKET_NAME")
}

func PutObject(ctx context.Context, objectName string, reader io.Reader, objectSize int64, opts minio.PutObjectOptions) (err error) {
	_, err = minioClient.PutObject(ctx, bucketName, objectName, reader, objectSize, opts)
	if err != nil {
		log.Fatalln(err)
	}
	return err
}

func TagObject(ctx context.Context, objectName string, tag string) error {
	tags, err := tags.NewTags(map[string]string{
		"tag": tag,
	}, false)
	if err != nil {
		log.Fatalln(err)
	}
	err = minioClient.PutObjectTagging(ctx, bucketName, objectName, tags, minio.PutObjectTaggingOptions{})
	if err != nil {
		log.Fatalln(err)
	}
	return err
}

func GetObjectTag(ctx context.Context, objectName string) (string, error) {
	result, err := minioClient.GetObjectTagging(ctx, bucketName, objectName, minio.GetObjectTaggingOptions{})
	if err != nil {
		log.Fatalln(err)
	}
	return result.ToMap()["tag"], err
}

func GetObject(ctx context.Context, objectName string, opts minio.GetObjectOptions) (obj *minio.Object, err error) {
	obj, err = minioClient.GetObject(ctx, bucketName, objectName, opts)
	if err != nil {
		log.Fatalln(err)
	}
	return obj, err
}

func RemoveObject(ctx context.Context, objectName string, opts minio.RemoveObjectOptions) (err error) {
	err = minioClient.RemoveObject(ctx, bucketName, objectName, opts)
	if err != nil {
		log.Fatalln(err)
	}
	return err
}
